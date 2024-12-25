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
 * Config : modules
 *
 * @author fr33z00 <https://github.com/fr33z00>
 * @contrib Bertrand Boutillier <b.boutillier@gmail.com>
 */
$debug = '';
$template = 'configModules';

$p['page']['modules'] = msModules::getInstalledModulesNamesAndVersions();

$config = new msConfiguration;
foreach ($p['page']['modules'] as $k => $v) {
	// paramètres spécifiques
	$p['page']['modulesConfig'][$v['name']] = $config->getModuleDefaultParameters($v['name']);
	// infos génériques
	$p['page']['modulesInfosGen'][$v['name']] = msModules::getModuleInfosGen($v['name']);
}
