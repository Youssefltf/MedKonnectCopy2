<?php
/*
 * This file is part of MedKonnectEHR.
 *
 * Copyright (c) 2021      DEMAREST Maxime <maxime@indelog.fr>
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
 * Config : gérer les tags universelle
 *
 * @author DEMAREST Maxime <maxime@indelog.fr>
 */

 //admin uniquement
if (!msUser::checkUserIsAdmin()) {
    $template="forbidden";
    return;
}

$template='univTagsConfig';
$debug='';

$p['page']['univTagsTypeList'] = msUnivTags::getTypeList();
