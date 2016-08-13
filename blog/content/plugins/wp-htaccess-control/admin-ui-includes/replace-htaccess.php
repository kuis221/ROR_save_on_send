<?php global $WPhtc; ?>
<!-- Replace WordPress htaccess -->
<div class="wphtc-section">
    <div class="wphtc-section-title stuffbox">
        <div title="Click to toggle" class="handlediv"
             style="background:url('<?php bloginfo("wpurl") ?>/wp-admin/images/menu-bits.gif') no-repeat scroll left -111px transparent">
            <br></div>
        <h3><?php _e('Replace WordPress htaccess', 'wp-htaccess-control'); ?></h3>
    </div>
    <table class="form-table wphtc-inputs">
        <tr valign="top">
            <td>
                <textarea name="WPhtc_wp_hta" style="width:100%;"
                          rows="7" <?php if ($WPhtc->get_data('jim_morgan_hta')) {
                    echo "readonly='true' class='readonly'";
                } ?>><?php echo stripslashes($WPhtc->get_data('wp_hta')); ?></textarea>

                <p class="description"><?php _e('Leave empty for default.', 'wp-htaccess-control'); ?></p>
            </td>
            <td style="width:50%;">
                <p class="description"><?php _e('This rules will be printed instead of WordPress rules.', 'wp-htaccess-control'); ?></p>

                <p class="description"><?php _e('Please double check them before saving as a mistake could make your site inaccessible.', 'wp-htaccess-control'); ?></p>

                <p class="description"><?php _e('Original rules:', 'wp-htaccess-control'); ?></p>

                <p class="description">
                    <code><?php echo nl2br(htmlspecialchars(substr($WPhtc->get_data('htaccess_original'), 0, -1))); ?></code>
                </p>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <p><?php _e("For instance, <strong><a href='http://www.webmasterworld.com/apache/4053973.htm'>Jim Morgan's wordpress htaccess</a></strong> has been reported to \"speed up your WP mod_rewrite code by a factor of more than two\".", 'wp-htaccess-control'); ?></p>

                <pre>RewriteEngine on
# Unless you have set a different RewriteBase preceding this point,
# you may delete or comment-out the following RewriteBase directive:
RewriteBase /
# if this request is for "/" or has already been rewritten to WP
RewriteCond $1 ^(index.php)?$ [OR]
# or if request is for image, css, or js file
RewriteCond $1 .(gif|jpg|jpeg|png|css|js|ico)$ [NC,OR]
# or if URL resolves to existing file
RewriteCond %{REQUEST_FILENAME} -f [OR]
# or if URL resolves to existing directory
RewriteCond %{REQUEST_FILENAME} -d
# then skip the rewrite to WP
RewriteRule ^(.*)$ - [S=1]
# else rewrite the request to WP
RewriteRule . /index.php [L]
                </pre>
                <p><?php _e("Please note, if your WordPress install is in a subdirectory, you'll have to adjust the first RewriteBase and the last RewriteRule accordingly <br/>(ie:  <code>RewriteBase /SUBDIRECTORY/</code> and <code>RewriteRule . /SUBDIRECTORY/index.php [L]</code>)", 'wp-htaccess-control'); ?></p>
            </td>
        </tr>
    </table>
</div>