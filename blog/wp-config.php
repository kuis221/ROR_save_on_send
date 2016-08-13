<?php
/**
 * The base configurations of the WordPress.
 *
 * This file has the following configurations: MySQL settings, Table Prefix,
 * Secret Keys, WordPress Language, and ABSPATH. You can find more information
 * by visiting {@link http://codex.wordpress.org/Editing_wp-config.php Editing
 * wp-config.php} Codex page. You can get the MySQL settings from your web host.
 *
 * This file is used by the wp-config.php creation script during the
 * installation. You don't have to use the web site, you can just copy this file
 * to "wp-config.php" and fill in the values.
 *
 * @package WordPress
 */
 
// Include local configuration
if (file_exists(dirname(__FILE__) . '/local-config.php')) {
	include(dirname(__FILE__) . '/local-config.php');
}

// Global DB config
if (!defined('DB_NAME')) {
	define('DB_NAME', 'blog.saveonsend');
}
if (!defined('DB_USER')) {
	define('DB_USER', 'root');
}
if (!defined('DB_PASSWORD')) {
	define('DB_PASSWORD', 'u5v7R56WL');
}
if (!defined('DB_HOST')) {
	define('DB_HOST', 'localhost');
}

/** Database Charset to use in creating database tables. */
if (!defined('DB_CHARSET')) {
	define('DB_CHARSET', 'utf8');
}

/** The Database Collate type. Don't change this if in doubt. */
if (!defined('DB_COLLATE')) {
	define('DB_COLLATE', '');
}

/** Enable W3 Total Cache */
define('WP_CACHE', true); // Added by W3 Total Cache


/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'Eb)@3IfgN36v-652r)<eOO[L1fJxm ~ZFH|l~-O7!|D+B[I*o#<B+w`+IzK|K$~^');
define('SECURE_AUTH_KEY',  'KE/3Yp ^Wm3<^O[(_b3|hru]oFk6cTvv!r mJ^pP=E~|%NdDac>BeAfy=7Y>7[W<');
define('LOGGED_IN_KEY',    '!7:TL/+ExysIpvb1djs~@cYqQ>?s5cN6!;I?AnfqNFRSVnYtQXbwuUK`AzwM[r`M');
define('NONCE_KEY',        'V~80C%+Zye@:`5dAfP0q7.^,@MxV4@:WK|9g[PkFqKb>TIU~QsGXODF9!9Ci|>nN');
define('AUTH_SALT',        'pl#v$f-m{=%Dkk?E+B_ozDV-hU,~H8M0K_S?w)r6K_>N13+-FWl$Q6no<X$l|f<3');
define('SECURE_AUTH_SALT', '_~)?DDKoX/om4Q@I!>q<j+b-F2wA4-B6Wv2J{K%[}-l;w#{=w*vQD?cpo(YnLF*x');
define('LOGGED_IN_SALT',   'CX&n,x{[Y9hydR5GA?6i[2,pbu%XDmSbnDgu1+P|c*YUkS7R,YK5QkL8+F&:7W !');
define('NONCE_SALT',       '[:zVn:sB)T!IAtBD6{jG9(<&lbt7:@syaU~i5?BQy:62GgS/5y=VABF5u/v3WCI,');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each a unique
 * prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * WordPress Localized Language, defaults to English.
 *
 * Change this to localize WordPress. A corresponding MO file for the chosen
 * language must be installed to wp-content/languages. For example, install
 * de_DE.mo to wp-content/languages and set WPLANG to 'de_DE' to enable German
 * language support.
 */
define('WPLANG', '');


/**
 * Set custom paths
 *
 * These are required because wordpress is installed in a subdirectory.
 */
if (!defined('WP_SITEURL')) {
	define('WP_SITEURL', 'http://' . $_SERVER['SERVER_NAME'] . '/blog/wordpress');
}
if (!defined('WP_HOME')) {
	define('WP_HOME',    'http://' . $_SERVER['SERVER_NAME'] . '/blog/');
}
if (!defined('WP_CONTENT_DIR')) {
	define('WP_CONTENT_DIR', dirname(__FILE__) . '/content');
}
if (!defined('WP_CONTENT_URL')) {
	define('WP_CONTENT_URL', 'http://' . $_SERVER['SERVER_NAME'] . '/blog/content');
}


/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 */
if (!defined('WP_DEBUG')) {
	define('WP_DEBUG', false);
}

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');