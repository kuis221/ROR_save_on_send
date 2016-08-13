<?php global $WPhtc;?>
<!-- Custom Search Permalink -->
<div class="wphtc-section">
    <div class="wphtc-section-title stuffbox">
        <div title="Click to toggle" class="handlediv"
             style="background:url('<?php bloginfo("wpurl") ?>/wp-admin/images/menu-bits.gif') no-repeat scroll left -111px transparent">
            <br></div>
        <h3><?php _e('Custom Search Permalink', 'wp-htaccess-control'); ?></h3>
    </div>
    <table class="form-table wphtc-inputs">
        <tr valign="top">
            <th scope="row" style="width:18%;"><?php _e('Search Base', 'wp-htaccess-control'); ?></th>
            <td>
                <input type="text" name="WPhtc_custom_search_permalink"
                       value="<?php echo $WPhtc->get_data('custom_search_permalink'); ?>"/>

                <p><code><?php bloginfo('url') ?>/<em><?php _e('(your-base)', 'wp-htaccess-control'); ?></em>/search-term</code>
                </p>
            </td>
            <td valign="middle">
                <p class="description"><?php _e('Permalink settings must be set and not Default (/?p=123).', 'wp-htaccess-control'); ?></p>

                <p class="description"><?php _e('If set, the search base will always be used instead of "?s=search-term".', 'wp-htaccess-control'); ?></p>

                <p class="description"><?php _e('If you do not want to use a custom Search Permalink base just leave the field empty.', 'wp-htaccess-control'); ?></p>
            </td>
        </tr>
    </table>
</div>