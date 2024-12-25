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
 * Obtenir les infos de la carte Vitale en fonction du module externe concerné.
 * Avec rapprochement aux dossiers patients potentiellement concordants
 *
 * @author Bertrand Boutillier <b.boutillier@gmail.com>
 */

if ($p['config']['optionGeActiverVitaleLecture'] == 'true' and !empty($p['config']['vitaleService'])) {

	$vitale = new msVitale;
	exit($vitale->getJsonCpsVitalDataWithPeopleID());
}
