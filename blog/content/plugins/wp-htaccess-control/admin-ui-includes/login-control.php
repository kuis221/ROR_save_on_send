<?php global $WPhtc;?>
<!-- Login Control -->
<div class="wphtc-section">
    <div class="wphtc-section-title stuffbox">
        <div title="Click to toggle" class="handlediv"
             style="background:url('<?php bloginfo("wpurl") ?>/wp-admin/images/menu-bits.gif') no-repeat scroll left -111px transparent">
            <br></div>
        <h3><?php _e('Login Control', 'wp-htaccess-control'); ?></h3>
    </div>
    <table class="form-table wphtc-inputs">
        <tr valign="top">
            <th scope="row" style="width:18%;"></th>
            <td valign="middle" colspan="2">
                <p class="description"><?php _e('The options below concern wp-login.php. You\'ll be able to redirect all traffic away from that page and set some allowed IPs.', 'wp-htaccess-control'); ?></p>

                <p class="description"><?php _e('BEWARE: once disabled you won\'t be able to login through that form in any way, except for the listed IPs.', 'wp-htaccess-control'); ?></p>

                <p class="description"><?php _e('If everything goes wrong directly edit your .htaccess file and delete the relevant part somewhere at the top.', 'wp-htaccess-control'); ?></p>
            </td>
        </tr>
        <tr valign="top">
            <th scope="row" style="width:18%;"><?php _e('Disable wp-login.php', 'wp-htaccess-control'); ?></th>
            <td>
                <input type="checkbox" name="WPhtc_login_disabled"
                       value="true" <?php if ($WPhtc->get_data('login_disabled')) {
                    echo "checked";
                } ?>/>
            </td>
            <td valign="middle">
                <p class="description"><?php _e('This is the main switch. Make sure you know what you\'re doing.', 'wp-htaccess-control'); ?></p>
            </td>
        </tr>
        <tr valign="top">
            <th scope="row" style="width:18%;"><?php _e('Redirect', 'wp-htaccess-control'); ?></th>
            <td valign="middle">
                <input type="text" name="WPhtc_login_redirection"
                       value="<?php echo $WPhtc->get_data('login_redirection') ?>"/>
            </td>
            <td valign="middle">
                <p class="description"><?php _e('This will be used as redirection url. You might use something like "member-login" to redirect people to "http://yoursite.com/member-login/". If empty the home page will be served as redirection.', 'wp-htaccess-control'); ?></p>
            </td>
        </tr>
        <tr valign="top">
            <th scope="row" style="width:18%;"><?php _e('Allowed IPs', 'wp-htaccess-control'); ?></th>
            <td>
                <textarea name="WPhtc_login_ips"><?php if ($WPhtc->get_data('login_ips')) {
                        echo implode($WPhtc->get_data('login_ips'), "\n");
                    } ?></textarea>
            </td>
            <td valign="middle">
                <p class="description"><?php _e('List of IPs allowed to access wp-login.php.', 'wp-htaccess-control'); ?></p>

                <p class="description"><?php _e('Make sure you are have a static IP when using this.'); ?></p>
            </td>
        </tr>
        <tr valign="top">
            <th scope="row" style="width:18%;"><?php _e('Half-mode', 'wp-htaccess-control'); ?></th>
            <td>
                <input type="checkbox" name="WPhtc_login_half_mode"
                       value="true" <?php if ($WPhtc->get_data('login_half_mode')) {
                    echo "checked";
                } ?>/>
            </td>
            <td valign="middle">
                <p class="description"><?php _e('(BETA) If set, this will still allow access to POST (login) requests, logout and to the password recovery form. I don\'t think this is very useful at the moment (login error messages will still show up on wp-login.php) but may be helpful for AJAX use.', 'wp-htaccess-control'); ?></p>
            </td>
        </tr>
    </table>
</div>