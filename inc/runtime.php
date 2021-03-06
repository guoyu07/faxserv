<?php
/**
    *
    * See docs/AUTHORS and docs/COPYRIGHT for relevant info.
    *
    * This program is free software; you can redistribute it and/or modify
    * it under the terms of the GNU General Public License as published by
    * the Free Software Foundation; either version 2 of the License, or
    * (at your option) any later version.
    * 
    * This program is distributed in the hope that it will be useful,
    * but WITHOUT ANY WARRANTY; without even the implied warranty of
    * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    * GNU General Public License for more details.
    * 
    * You should have received a copy of the GNU General Public License
    * along with this program; if not, write to the Free Software
    * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
    *
    * @author Jeremy Booker <jbooker at tux dot appstate dot edu>
*/


//PHPWS_Core::initModClass('skeleton', 'Skeleton_Runtime.php');
//Skeleton_Runtime::showBlock();

if(!isset($_REQUEST['module'])){
    PHPWS_Core::initModClass('faxmaster', '../index.php');
}

if(!Current_User::isLogged()) {
    Layout::add('<div class="text-center"><a href="secure" class="btn btn-lg btn-primary">Sign In</a></div>');
}
?>
