<?php global $WPhtc;?>
<!-- More Rewrite Settings -->
<div class="wphtc-section">
    <div class="wphtc-section-title stuffbox">
        <div title="Click to toggle" class="handlediv"
             style="background:url('<?php bloginfo("wpurl") ?>/wp-admin/images/menu-bits.gif') no-repeat scroll left -111px transparent">
            <br></div>
        <h3><?php _e('More Rewrite Settings', 'wp-htaccess-control'); ?></h3>
    </div>
    <table class="form-table wphtc-inputs">
        <tr valign="top">
            <th scope="row" style="width:18%;"><?php _e("Remove hierarchy", 'wp-htaccess-control'); ?></th>
            <td style="width:3%;" valign="middle">
                <input type="checkbox" name="WPhtc_remove_hierarchy"
                       value="true" <?php if ($WPhtc->get_data('remove_hierarchy')) {
                    echo "checked";
                } ?>/>
            </td>
            <td valign="middle">
                <p class="description"><?php _e("Remove hierarchy from taxonomy permalinks (this might be interesting when removing the category base).", 'wp-htaccess-control'); ?></p>
            </td>
        </tr>
        <!--<tr valign="top">
						<th scope="row" style="width:18%;"><?php _e(".html suffix", 'wp-htaccess-control'); ?></th>
						<td style="width:3%;" valign="middle">
							<input type="checkbox" name="WPhtc_suffix_html" value="true" <?php if($WPhtc->get_data('suffix_html')){ echo "checked";}?>/>
						</td>
						<td valign="middle">
							<p class="description"><?php _e("Add '.html' at the end of taxonomy permalinks.", 'wp-htaccess-control'); ?></p>
						</td>
					</tr>-->
    </table>
</div>