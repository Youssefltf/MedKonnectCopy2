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
 * Afficher le XML CDA d'un document généré en interne
 *
 * @author Bertrand Boutillier <b.boutillier@gmail.com>
 */

$debug='';

$cda = new msCDA;
$cda->setObjetID($match['params']['objetID']);

header('Content-Type: application/xml; charset=utf-8');
echo trim($cda->getCdaXml());
