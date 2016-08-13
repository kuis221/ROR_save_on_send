<?php global $WPhtc;?>
<!-- htaccess Suggestions -->
<div class="wphtc-section">
    <div class="wphtc-section-title stuffbox">
        <div title="Click to toggle" class="handlediv"
             style="background:url('<?php bloginfo("wpurl") ?>/wp-admin/images/menu-bits.gif') no-repeat scroll left -111px transparent">
            <br></div>
        <h3><?php _e('htaccess Suggestions', 'wp-htaccess-control'); ?></h3>
    </div>
    <table class="form-table wphtc-inputs">
        <tr valign="top">
            <th scope="row" style="width:18%;"><?php _e('ServerSignature', 'wp-htaccess-control'); ?></th>
            <td style="width:3%;" valign="middle">
                <input type="checkbox" name="WPhtc_disable_serversignature"
                       value="true" <?php if ($WPhtc->get_data('disable_serversignature')) {
                    echo "checked";
                } ?>/>
            </td>
            <td valign="middle">
                <p class="description"><?php _e('Disable the ServerSignature on server generated error pages.', 'wp-htaccess-control'); ?></p>
            </td>
        </tr>
        <tr valign="top">
            <th scope="row"><?php _e('Indexes', 'wp-htaccess-control'); ?></th>
            <td style="width:3%;" valign="middle">
                <input type="checkbox" name="WPhtc_disable_indexes"
                       value="true" <?php if ($WPhtc->get_data('disable_indexes')) {
                    echo "checked";
                } ?>/>
            </td>
            <td valign="middle">
                <p class="description"><?php _e('Disable directory browsing.', 'wp-htaccess-control'); ?></p>
            </td>
        </tr>
        <tr valign="top">
            <th scope="row"><?php _e('Protect wp-config.php file', 'wp-htaccess-control'); ?></th>
            <td style="width:3%;" valign="middle">
                <input type="checkbox" name="WPhtc_protect_wp_config"
                       value="true" <?php if ($WPhtc->get_data('protect_wp_config')) {
                    echo "checked";
                } ?>/></td>
            <td valign="middle">
                <p class="description"><?php _e('Deny access to wp-config.php file.', 'wp-htaccess-control'); ?></p>
            </td>
        </tr>
        <tr valign="top">
            <th scope="row"><?php _e('Protect htaccess file', 'wp-htaccess-control'); ?></th>
            <td style="width:3%;" valign="middle">
                <input type="checkbox" name="WPhtc_protect_htaccess"
                       value="true" <?php if ($WPhtc->get_data('protect_htaccess')) {
                    echo "checked";
                } ?>/></td>
            <td valign="middle">
                <p class="description"><?php _e('Deny access to .htaccess file.', 'wp-htaccess-control'); ?></p>
            </td>
        </tr>
        <tr valign="top">
            <th scope="row"><?php _e('Protect comments.php', 'wp-htaccess-control'); ?></th>
            <td style="width:3%;" valign="middle">
                <input type="checkbox" name="WPhtc_protect_comments"
                       value="true" <?php if ($WPhtc->get_data('protect_comments')) {
                    echo "checked";
                } ?>/></td>
            <td valign="middle">
                <p class="description"><?php _e('Deny comment posting to no referrer requests. This will avoid spam bots coming from nowhere.', 'wp-htaccess-control'); ?></p>
            </td>
        </tr>
        <tr valign="top">
            <th scope="row"><?php _e('mod_gzip', 'wp-htaccess-control'); ?></th>
            <td style="width:3%;" valign="middle">
                <input type="checkbox" name="WPhtc_gzip" value="true" <?php if ($WPhtc->get_data('gzip')) {
                    echo "checked";
                } ?>/>
            </td>
            <td valign="middle">
                <p class="description"><?php _e('Use mod_gzip if available.', 'wp-htaccess-control'); ?></p>
            </td>
        </tr>
        <tr valign="top">
            <th scope="row"><?php _e('mod_deflate', 'wp-htaccess-control'); ?></th>
            <td style="width:3%;" valign="middle">
                <input type="checkbox" name="WPhtc_deflate" value="true" <?php if ($WPhtc->get_data('deflate')) {
                    echo "checked";
                } ?>/>
            </td>
            <td valign="middle">
                <p class="description"><?php _e('Use mod_deflate if available.', 'wp-htaccess-control'); ?></p>
            </td>
        </tr>
        <tr valign="top">
            <th scope="row"><?php _e('Limit Upload Size', 'wp-htaccess-control'); ?></th>
            <td style="width:3%;" valign="middle">
                <input type="text" name="WPhtc_up_limit" value="<?php echo $WPhtc->get_data('up_limit'); ?>"/>
            </td>
            <td valign="middle">
                <p class="description"><?php _e('If set, this value in MB will be used as limit to file uploads.', 'wp-htaccess-control'); ?></p>
            </td>
        </tr>
        <tr valign="top">
            <th scope="row"><?php _e('Admin Email', 'wp-htaccess-control'); ?></th>
            <td style="width:3%;">
                <input type="text" name="WPhtc_admin_email" value="<?php echo $WPhtc->get_data('admin_email') ?>"/>
            </td>
            <td valign="middle">
                <p class="description"><?php _e('If set, this will be used as the admin email on server generated error pages.', 'wp-htaccess-control'); ?></p>
            </td>
        </tr>
        <tr valign="top">
            <th scope="row"><?php _e('Disable image hotlinking', 'wp-htaccess-control'); ?></th>
            <td style="width:3%;">
                <input type="text" name="WPhtc_disable_hotlink"
                       value="<?php echo $WPhtc->get_data('disable_hotlink'); ?>"/>
            </td>
            <td valign="middle">
                <p class="description"><?php _e('If set, this url will be used as redirection to hotlinked images (you should be using an image url here). If you prefer no output on hotlinked images use "_".', 'wp-htaccess-control'); ?></p>
            </td>
        </tr>
        <tr valign="top">
            <th scope="row"><?php _e('Disable file hotlinking extensions', 'wp-htaccess-control'); ?></th>
            <td style="width:3%;">
                <input type="text" name="WPhtc_disable_file_hotlink_ext"
                       value="<?php echo $WPhtc->get_data('disable_file_hotlink_ext') ?>"/>
            </td>
            <td valign="middle">
                <p class="description"><?php _e('If set, this file extensions will not be hotlinkable.', 'wp-htaccess-control'); ?></p>

                <p class="description"><?php _e('Separate different extensions with a white-space, ie: "pdf doc zip".', 'wp-htaccess-control'); ?></p>
            </td>
        </tr>
        <tr valign="top">
            <th scope="row"><?php _e('File hotlinking redirection', 'wp-htaccess-control'); ?></th>
            <td style="width:3%;">
                <input type="text" name="WPhtc_disable_file_hotlink_redir"
                       value="<?php echo $WPhtc->get_data('disable_file_hotlink_redir') ?>"/>
            </td>
            <td valign="middle">
                <p class="description"><?php _e('If set, this url will be used as redirection for hotlinked files.', 'wp-htaccess-control'); ?></p>
            </td>
        </tr>
        <tr valign="top">
            <th scope="row"><?php _e('500 error', 'wp-htaccess-control'); ?></th>
            <td style="width:3%;" valign="middle">
                <input type="text" name="WPhtc_redirect_500" value="<?php echo $WPhtc->get_data('redirect_500'); ?>"/>
            </td>
            <td valign="middle">
                <p class="description"><?php _e('If set, this path will be used as page to 500 errors (example: /error.php).', 'wp-htaccess-control'); ?></p>
            </td>
        </tr>
        <tr valign="top">
            <th scope="row"><?php _e('403 error', 'wp-htaccess-control'); ?></th>
            <td style="width:3%;" valign="middle">
                <input type="text" name="WPhtc_redirect_403" value="<?php echo $WPhtc->get_data('redirect_403'); ?>"/>
            </td>
            <td valign="middle">
                <p class="description"><?php _e('If set, this path will be used as page to 403 errors (example: /error.php).', 'wp-htaccess-control'); ?></p>
            </td>
        </tr>
        <tr valign="top">
            <th scope="row" valign="middle"><?php _e('Canonical Url', 'wp-htaccess-control'); ?></th>
            <td style="width:3%;" valign="middle">
                <select name="WPhtc_canon">
                    <option value=""></option>
                    <option value="www" <?php if ($WPhtc->get_data('canon') == 'www') {
                        echo "selected";
                    } ?>><?php _e('Force WWW', 'wp-htaccess-control'); ?></option>
                    <option value="simple" <?php if ($WPhtc->get_data('canon') == 'simple') {
                        echo "selected";
                    } ?>><?php _e('Force non-WWW', 'wp-htaccess-control'); ?></option>
                </select>
            </td>
            <td valign="middle">
                <p class="description"><?php _e('This will force canonization. This will be done by simply modifying the wordpress "site url" and "home" options (not htaccess).', 'wp-htaccess-control'); ?></p>
            </td>
        </tr>
    </table>
</div>