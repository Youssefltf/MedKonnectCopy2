<?php

/**
 * Import CSV data into a MySQL database with duplicate handling and error logging.
 */

// Enable error reporting for debugging
error_reporting(E_ALL);
ini_set('display_errors', 1);

try {
	// echo "Connecting to the database...\n";

	// // Step 1: Connect to the database
	// $pdo = new PDO("mysql:host=localhost;dbname=medshakeehr;charset=utf8", "root", "PASSWORD", [
	// 	PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
	// 	PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
	// ]);

	// Step 2: Define the path to the CSV file
	$csvFile = __DIR__ . '/medicaments_tunisiens/medicaments_tn_amm.csv';
	$logFile = __DIR__ . '/medicaments_tunisiens/logs/problematic_rows.csv';

	// Step 3: Check if the CSV file exists and is readable
	if (!file_exists($csvFile) || !is_readable($csvFile)) {
		die("An error occurred: CSV file not found or not readable.\n");
	}

	// Step 4: Calculate total rows dynamically
	$totalRows = 0;
	$fileHandle = fopen($csvFile, 'r');
	while (($line = fgetcsv($fileHandle)) !== false) {
		if (!empty($line) && count(array_filter($line)) > 0) { // Ignore empty or malformed rows
			$totalRows++;
		}
	}
	fclose($fileHandle);

	// Subtract 1 for the header row
	$totalRows -= 1;
	if ($totalRows <= 0) {
		die("The CSV file contains no data rows.\n");
	}

	// Step 5: Open the CSV file for reading
	$file = fopen($csvFile, 'r');
	if ($file === false) {
		throw new Exception("Unable to open the CSV file.");
	}

	// Step 6: Read the header row
	$header = fgetcsv($file);
	if ($header === false) {
		throw new Exception("Failed to read the header row.");
	}

	// Define required columns
	$requiredColumns = ['AMM', 'Nom', 'Dosage', 'Forme', 'Date AMM', 'Laboratoire', 'DCI'];
	foreach ($requiredColumns as $column) {
		if (!in_array($column, $header)) {
			throw new Exception("Missing required column: $column in the CSV file.");
		}
	}
	$headerMap = array_flip($header);

	// Step 7: Prepare for row processing
	$occurrences = []; // Track duplicate occurrences
	$batchData = [];   // Collect rows for batch insertion
	$problematicRows = []; // Log problematic rows
	$batchSize = 1000; // Insert rows in batches of 1000
	$rowNumber = 0;

	// Begin transaction
	// $pdo->beginTransaction();

	while (($row = fgetcsv($file)) !== false) {
		$rowNumber++;

		// Extract fields
		$codeCIS = trim($row[$headerMap['AMM']] ?? '');
		$nom = trim($row[$headerMap['Nom']] ?? '');
		$dosage = trim($row[$headerMap['Dosage']] ?? '');
		$forme = trim($row[$headerMap['Forme']] ?? '');
		$dateAMM = trim($row[$headerMap['Date AMM']] ?? '');
		$laboratoire = trim($row[$headerMap['Laboratoire']] ?? '');
		$dci = trim($row[$headerMap['DCI']] ?? '');

		// Skip invalid rows
		if (empty($codeCIS)) {
			$problematicRows[] = $row;
			continue;
		}

		// Déterminer la voie d'administration
		$voieAdmin = determineVoieAdmin($forme, $nom);

		// Handle duplicates
		if (!isset($occurrences[$codeCIS])) {
			$occurrences[$codeCIS] = 0;
		}
		$occurrences[$codeCIS]++;
		$modifiedCodeCIS = $occurrences[$codeCIS] > 1 ? $codeCIS . '-' . ($occurrences[$codeCIS] - 1) : $codeCIS;

		// Concatenate 'denomination'
		$denomination = substr("$nom $dosage $forme", 0, 500);

		// Add data to the batch
		$batchData[] = [
			$modifiedCodeCIS,
			str_replace("'", "''", $denomination),
			str_replace("'", "''", substr($forme, 0, 255)),
			$voieAdmin,
			$dateAMM,
			'Autorisation active',
			'Commercialisée',
			str_replace("'", "''", substr($laboratoire, 0, 500)),
			str_replace("'", "''", substr($dci, 0, 500))
		];

		// Insert batch if the batch size is reached
		if (count($batchData) >= $batchSize) {
			insertBatch(/*$pdo, */$batchData);
			$batchData = []; // Clear batch
		}

		// echo "\rProcessing row $rowNumber of $totalRows...";
	}

	// Insert remaining rows
	if (!empty($batchData)) {
		insertBatch(/*$pdo, */$batchData);
	}

	// Commit transaction
	// $pdo->commit();

	// Close the CSV file
	fclose($file);

	// Log problematic rows
	if (!empty($problematicRows)) {
		$logHandle = fopen($logFile, 'w');
		if ($logHandle !== false) {
			fputcsv($logHandle, $header); // Write header
			foreach ($problematicRows as $problematicRow) {
				fputcsv($logHandle, $problematicRow);
			}
			fclose($logHandle);
			echo "\nProblematic rows logged to $logFile\n";
		} else {
			echo "\nFailed to write problematic rows to log file.\n";
		}
	}

	// Step 9: Create the view
	echo "\nCreating view `bdpm_specialitesVirtuelles_tn`...\n";
	$createViewSQL = "
        CREATE OR REPLACE ALGORITHM=TEMPTABLE SQL SECURITY DEFINER VIEW `bdpm_specialitesVirtuelles_tn` AS
        (
            SELECT
                `s`.`codeCIS` AS `codeSPE`,
                `s`.`codeCIS` AS `codeCIS`,
                `s`.`denomination` AS `denomination`,
                `s`.`formePharma` AS `formePharma`,
                `s`.`voiesAdmin` AS `voiesAdmin`,
                `s`.`statutAdminAMM` AS `statutAdminAMM`,
                `s`.`typeProcedAMM` AS `typeProcedAMM`,
                `s`.`etatCommercialisation` AS `etatCommercialisation`,
                `s`.`dateAMM` AS `dateAMM`,
                `s`.`statutBdm` AS `statutBDM`,
                `s`.`numAutoEU` AS `numAutoEU`,
                `s`.`tituAMM` AS `tituAMM`,
                `s`.`surveillanceRenforcee` AS `surveillanceRenforcee`,
                `s`.`DCI` AS `DCI`,
                '0' AS `monovir`
            FROM
                `bdpm_specialites_tn` `s`
        );
    ";
	// $pdo->exec($createViewSQL);
	echo "View `bdpm_specialitesVirtuelles_tn` created successfully.\n";

	echo "Processing completed.\n";
	if (!empty($problematicRows)) {
		echo "Some rows caused issues. Please review 'problematic_rows.csv'.\n";
	} else {
		echo "All rows processed successfully without errors.";
	}
} catch (PDOException $e) {
	echo "Database error: " . $e->getMessage();
	// $pdo->rollBack(); // Roll back transaction on error
} catch (Exception $e) {
	echo "Error: " . $e->getMessage();
}

/**
 * Détermine la voie d'administration en fonction de la forme pharmaceutique.
 */
function determineVoieAdmin($formePharma, $denomination)
{
	$formePharma = strtolower($formePharma);
	$denomination = strtolower($denomination);

	$mappingVoies = [
		"orale" => [
			"comprimé", "comprimé pelliculé", "comprimé pelliculé sécable", "comprimé orodispersible",
			"comprimé dispersible sécable", "comprimé à libération prolongée", "gélule",
			"gélule gastrorésistante", "granulés pour solution buvable", "sirop",
			"suspension buvable", "solution buvable", "comprimé effervescent",
			"comprimé à croquer", "poudre pour solution orale", "granules effervescents",
			"poudre orale", "capsule molle", "ampoules buvables", "comprimé pour suspension buvable",
			"pastilles", "comprime enrobé", "gouttes buvables", "granulés à libération prolongée",
			"granules", "comprime dispersible"
		],
		"intraveineuse" => [
			"solution pour perfusion", "injection iv", "intraveineuse", "perfus",
			"solution injectable pour perfusion", "poudre pour solution pour perfusion",
			"poudre lyophilisée à diluer pour perfusion", "emulsion injectable pour perfusion",
			"pdre p.prep.injectable", "poudre pour suspension injectable",
			"emulsion injectable"
		],
		"intramusculaire" => [
			"solution injectable", "ampoule im", "intramusculaire",
			"solution injectable i.m et buvable", "poudre pour suspension injectable",
			"suspension injectable"
		],
		"sous-cutanée" => [
			"injection sc", "seringue préremplie sc"
		],
		"cutanée" => [
			"creme dermique", "pommade dermique", "gel dermique", "lotion",
			"shampooing", "poudre à usage externe", "baume", "liniment",
			"gel moussant", "spray solution", "lait dermique", "patch",
			"solution externe", "emulsion"
		],
		"ophtalmique" => [
			"collyre", "collyre monodose", "pommade ophtalmique",
			"solution ophtalmique", "gel ophtalmique", "solution intra-oculaire", "préparation viscoélastique"
		],
		"nasale" => [
			"spray nasal", "solution pour pulvérisation nasale", "solution nasale",
			"gouttes nasales", "suspension nasale"
		],
		"pulmonaire" => [
			"aérosol", "inhalateur", "poudre pour inhalation buccale",
			"suspension pour inhalation", "liquide volatil pour inhalation",
			"liquide pour inhalation", "solution pour pulvérisation buccale",
			"solution pour inhalation"
		],
		"rectale" => [
			"suppositoire", "suppositoire sécable", "gel rectal", "pommade rectale",
			"suspension rectale", "solution rectale", "mousse rectale"
		],
		"vaginale" => [
			"ovule", "crème vaginale", "gel vaginal",
			"capsules gynécologiques", "solution gynécologique", "gélule vaginale"
		],
		"transdermique" => [
			"dispositif trans-dermique", "emplâtre", "patch transdermique"
		],
		"auriculaire" => [
			"gouttes auriculaires", "poudre auriculaire"
		],
		"autre spécifique" => [
			"implant", "perfusion intrathécale", "intra-articulaire",
			"suspension pour administration intravésicale",
			"doses homéopathiques", "globules", "gel urétral",
			"susp. p. instill endotrachéobronchique", "soluté pour dialyse péritonéale"
		]
	];

	foreach ($mappingVoies as $voie => $motsCles) {
		foreach ($motsCles as $motCle) {
			if (strpos($formePharma, $motCle) !== false || strpos($denomination, $motCle) !== false) {
				return $voie;
			}
		}
	}

	return "inconnue";
}

/**
 * Insère les données dans la base en batch.
 */
function insertBatch(/*PDO $pdo, */array $batchData)
{
	$sql = "
        INSERT INTO bdpm_specialites_tn (codeCIS, denomination, formePharma, voiesAdmin, dateAMM, statutAdminAMM, etatCommercialisation, tituAMM, DCI)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
    ";
	// echo "sql: '" . $sql . "'\n";

	// $stmt = $pdo->prepare($sql);
	foreach ($batchData as $data) {
		// $stmt->execute($data);
		// echo "data: '" . print_r($data) . "'\n";
		echo "INSERT INTO bdpm_specialites_tn (codeCIS, denomination, formePharma, voiesAdmin, dateAMM, statutAdminAMM, etatCommercialisation, tituAMM, DCI) VALUES ('" . $data[0] . "', '" . $data[1] . "', '" . $data[2] . "', '" . $data[3] . "', '" . $data[4] . "', '" . $data[5] . "', '" . $data[6] . "', '" . $data[7] . "', '" . $data[8] . "');\n";
	}
}
