<?php
/*
Plugin Name: Force SSL
Plugin URI: http://www.almosteffortless.com/wordpress/force-ssl/
Description: For those will an SSL certificate, this plugin forces an HTTPS connection for security purposes.
Version: 1.3
Author: Trevor Turk, BestWebLayout
Author URI: http://www.almosteffortless.com
License: GPLv3 or later
*/

/*  Copyright 2005  Trevor Turk  (email : trevorturk@yahoo.com)

	This program is free software; you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation; either version 2 of the License, or
	(at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with this program; if not, write to the Free Software
	Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*/

if ( ! function_exists( 'force_ssl' ) ) {
	function force_ssl() {
		if ( $_SERVER["HTTPS"] != "on" ) {
			$newurl = "https://" . $_SERVER["SERVER_NAME"] . $_SERVER["REQUEST_URI"];
			wp_redirect( $newurl );
			exit();
		}
	}
}

add_action( 'plugins_loaded', 'force_ssl' );
?>