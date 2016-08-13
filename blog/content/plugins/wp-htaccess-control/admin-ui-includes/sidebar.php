<?php
global $WPhtc;
$plugin_path = $WPhtc->plugin_path;
$plugin_url = $WPhtc->plugin_url;
?>

<div id="wphtc-sidebar">
    <div class="wphtc-section">
        <div class="wphtc-section-title stuffbox">
            <!--<div title="Click to toggle" class="handlediv" style="background:url('<?php bloginfo("wpurl")?>/wp-admin/images/menu-bits.gif') no-repeat scroll left -111px transparent"><br></div>-->
            <h3><?php _e('About this Plugin', 'wp-htaccess-control'); ?></h3>
        </div>
        <div class="wphtc-inputs">
            <ul>
                <li><a href="http://antonioandra.de/wp-htaccess-control"><img width="16" height="16"
                                                                              src="<?php echo $plugin_url ?>/images/antonioandra.de_favicon.png">
                        Plugin Homepage</a></li>
                <li><a href="http://wordpress.org/extend/plugins/wp-htaccess-control/"><img
                            src="<?php echo $plugin_url ?>/images/favicon.ico"> Plugin at WordPress.org </a></li>
                <li>
                    <a href="https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=antonio%40antonioandra%2ede&lc=US&item_name=WP%20htaccess%20Control%20%28Antonio%20Andrade%29&no_note=0&currency_code=EUR&bn=PP%2dDonationsBF%3abtn_donate_SM%2egif%3aNonHostedGuest"><img
                            width="16" height="16" src="<?php echo $plugin_url ?>/images/pp_favicon_x.ico"> Donate with
                        Paypal</a></li>
            </ul>
        </div>
    </div>
    <div class="wphtc-section">
        <div class="wphtc-section-title stuffbox">
            <h3><?php _e('Latest donations', 'wp-htaccess-control'); ?></h3>
        </div>
        <div class="wphtc-inputs">
            <iframe width="100%" src="http://antonioandra.de/wp-htaccess-control-donations"></iframe>
        </div>
    </div>
    <p id="foot">WP htaccess Control <?php _e('by', 'wp-htaccess-control'); ?> António Andrade</p>
</div>