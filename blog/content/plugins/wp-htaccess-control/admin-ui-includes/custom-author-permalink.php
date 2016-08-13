<?php global $WPhtc;?>
<!-- Custom Author Permalink -->
<div class="wphtc-section">
    <div class="wphtc-section-title stuffbox">
        <div title="Click to toggle" class="handlediv"
             style="background:url('<?php bloginfo("wpurl") ?>/wp-admin/images/menu-bits.gif') no-repeat scroll left -111px transparent">
            <br></div>
        <h3><?php _e('Custom Author Permalink', 'wp-htaccess-control'); ?></h3>
    </div>
    <table class="form-table wphtc-inputs">
        <tr valign="top">
            <th scope="row" style="width:18%;"><?php _e('Author Base', 'wp-htaccess-control'); ?></th>
            <td>
                <input type="text" name="WPhtc_cap" value="<?php echo $WPhtc->get_data('cap'); ?>"/>

                <p><code><?php bloginfo('url') ?>
                        /<em><?php _e('(your-base)', 'wp-htaccess-control'); ?></em>/admin</code></p>
            </td>
            <td valign="middle">
                <p class="description"><?php _e('Permalink settings must be set and not Default (/?p=123).', 'wp-htaccess-control'); ?></p>

                <p class="description"><?php _e('If set, the author base will be used as shown next to the form field.', 'wp-htaccess-control'); ?></p>

                <p class="description"><?php _e('If you do not want to use a custom Author Permalink base just leave the field empty.', 'wp-htaccess-control'); ?></p>
            </td>
        </tr>
        <?php if (class_exists('GoogleSitemapGeneratorLoader')) { ?>
            <tr valign="top">
                <th>Google XML Sitemap</th>
                <td>
                    <input type="checkbox" name="WPhtc_sm_enabled"
                           value="true" <?php if ($WPhtc->get_data('sm_enabled')) {
                        echo "checked";
                    } ?>/> <?php _e('Apply Custom Author Permalink on Generated Sitemap', 'wp-htaccess-control'); ?>
                </td>
                <td valign="middle">
                    <p class="description"><?php _e('Leave "Include author pages" unchecked on Google XML Sitemap options page if using this.', 'wp-htaccess-control'); ?></p>

                    <p class="description"><?php _e('However, if you want to adjust the "Priority" or "Change frequency" you should do so on the <a href="options-general.php?page=google-sitemap-generator/sitemap.php">Google XML Sitemap options page</a>.', 'wp-htaccess-control'); ?></p>
                </td>
            </tr>
        <?php } ?>
    </table>
</div>