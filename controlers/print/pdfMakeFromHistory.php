<?php
/*
 * This file is part of MedKonnectEHR.
 *
 * Copyright (c) 2018
 * Bertrand Boutillier <b.boutillier@gmail.com>
 * http://www.medkonnect.net
 *
 * MedKonnectEHR is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * any later version.
 *
 * MedKonnectEHR is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with MedKonnectEHR.  If not, see <http://www.gnu.org/licenses/>.
 */

/**
 * Fabriquer un PDF à partir d'une version sauvegardée en table printed
 *
 * @author Bertrand Boutillier <b.boutillier@gmail.com>
 *
 * SQLPREPOK
 */

$debug = '';
if (!is_numeric($match['params']['versionID'])) die();
if (!is_numeric($match['params']['patient'])) die();

if ($contenuFinalPDF = msSQL::sqlUniqueChamp("SELECT value from printed where id = :versionID and toID = :patientID limit 1", ['versionID' => $match['params']['versionID'], 'patientID' => $match['params']['patient']])) {

	$doc = new msPDF;
	$doc->setContenuFinalPDF($contenuFinalPDF);
	$doc->showPDF();
	die();
}
