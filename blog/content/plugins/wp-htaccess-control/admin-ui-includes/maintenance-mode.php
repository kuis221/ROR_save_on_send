<?php global $WPhtc;?>
<!-- Maintenance Mode -->
<div class="wphtc-section">
    <div class="wphtc-section-title stuffbox">
        <div title="Click to toggle" class="handlediv"
             style="background:url('<?php bloginfo("wpurl") ?>/wp-admin/images/menu-bits.gif') no-repeat scroll left -111px transparent">
            <br></div>
        <h3><?php _e('Maintenance Mode', 'wp-htaccess-control'); ?></h3>
    </div>
    <table class="form-table wphtc-inputs">
        <tr valign="top">
            <th scope="row" style="width:18%;"><?php _e('Maintenance Active', 'wp-htaccess-control'); ?></th>
            <td valign="middle">
                <input type="checkbox" name="WPhtc_maintenance_active"
                       value="true" <?php if ($WPhtc->get_data('maintenance_active')) {
                    echo "checked";
                } ?>/>
            </td>
            <td valign="middle">
                <p class="description"><?php _e('Toggles Maintenance Mode.', 'wp-htaccess-control'); ?></p>
            </td>
        </tr>
        <tr valign="top">
            <th scope="row" style="width:18%;"><?php _e('Allowed IPs', 'wp-htaccess-control'); ?></th>
            <td>
                <textarea name="WPhtc_maintenance_ips"><?php if ($WPhtc->get_data('maintenance_ips')) {
                        echo implode($WPhtc->get_data('maintenance_ips'), "\n");
                    } ?></textarea>
            </td>
            <td valign="middle">
                <p class="description"><?php _e('List of allowed IPs.', 'wp-htaccess-control'); ?></p>

                <p class="description"><?php _e('All the IPs not listed will view the 403 error page or be redirected to a page set below.', 'wp-htaccess-control'); ?></p>
            </td>
        </tr>
        <tr valign="top">
            <th scope="row" style="width:18%;"><?php _e('Redirection', 'wp-htaccess-control'); ?></th>
            <td>
                <input type="text" name="WPhtc_maintenance_redirection"
                       value="<?php echo $WPhtc->get_data('maintenance_redirection') ?>"/>
            </td>
            <td valign="middle">
                <p class="description"><?php _e('If set, this will be used as redirection for disallowed IPs. This could be an external url or a document on your server (local paths begin with a trailing slash)', 'wp-htaccess-control'); ?></p>
            </td>
        </tr>
    </table>
</div>