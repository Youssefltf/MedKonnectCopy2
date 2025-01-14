<?php
/*
 * This file is part of MedKonnectEHR.
 *
 * Copyright (c) 2020
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
 * Outils pour les images
 *
 * @author Bertrand Boutillier <b.boutillier@gmail.com>
 */


class msImageTools
{

	public static function rotate90($source, $dest, $direction = 'right')
	{
		if (!is_file($source)) return false;
		$image = new Imagick($source);
		if ($direction == 'left') {
			$angle = -90;
		} else {
			$angle = 90;
		}
		$image->rotateimage("#000", $angle);
		$image->setImageOrientation(imagick::ORIENTATION_TOPLEFT);
		return $image->writeImage($dest);
	}
}
