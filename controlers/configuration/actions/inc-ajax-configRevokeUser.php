<?php
/*
 * This file is part of MedKonnectEHR.
 *
 * Copyright (c) 2017
 * fr33z00 <https://github.com/fr33z00>
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
 * Config : Enlever un utilisateur (sans enlever ses fiches)
 *
 * @author fr33z00 <https://github.com/fr33z00>
 *
 * SQLPREPOK
 */

if (!msUser::checkUserIsAdmin()) {
	die("Erreur: vous n'êtes pas administrateur");
}

if (!isset($_POST['id']) or !is_numeric($_POST['id'])) die("Error");

msSQL::sqlQuery("UPDATE people set rank='', name=NULL, pass='' WHERE id = :id", ['id' => $_POST['id']]);

echo json_encode(array('ok'));
