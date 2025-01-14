<?php
/*
 * This file is part of MedKonnectEHR.
 *
 * Copyright (c) 2019
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
 * Configuration > ajax : déchiffrage d'une clef apicrypt
 *
 * @author Bertrand Boutillier <b.boutillier@gmail.com>
 */

if (!msUser::checkUserIsAdmin()) {
	die("Erreur: vous n'êtes pas administrateur");
}

msApicrypt2::getDecryptKey($_POST['source'], $_POST['destination'], $_POST['code']);

if (is_file($_POST['destination'])) {
	echo json_encode(array('ok'));
	@unlink($_POST['source']);
} else {
	http_response_code(404);
}
die;
