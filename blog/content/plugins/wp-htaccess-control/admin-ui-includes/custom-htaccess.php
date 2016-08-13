<?php global $WPhtc;?>
<!-- Custom htaccess -->
<div class="wphtc-section">
    <div class="wphtc-section-title stuffbox">
        <div title="Click to toggle" class="handlediv"
             style="background:url('<?php bloginfo("wpurl") ?>/wp-admin/images/menu-bits.gif') no-repeat scroll left -111px transparent">
            <br></div>
        <h3><?php _e('Custom htaccess', 'wp-htaccess-control'); ?></h3>
    </div>
    <table class="form-table wphtc-inputs">
        <tr valign="top">
            <td>
                <textarea name="WPhtc_hta" style="width:100%;"
                          rows="7"><?php echo stripslashes($WPhtc->get_data('hta')); ?></textarea>
            </td>
            <td style="width:50%;">
                <p class="description"><?php _e('This rules will be printed before any WordPress rules.', 'wp-htaccess-control'); ?></p>

                <p class="description"><?php _e('Please double check them before saving as a mistake could make your site inaccessible.', 'wp-htaccess-control'); ?></p>
                <ul class="description">
                    <li><a href="http://www.google.com/search?q=htaccess+tutorial"
                           title="Search for htaccess tutorials"><img width="16px" src="http://google.com/favicon.ico"
                                                                      alt="google favicon"> htaccess tutorial</a></li>
                    <li><a href="http://httpd.apache.org/docs/current/howto/htaccess.html"
                           title="Read about htaccess at apache.org"><img width="16px"
                                                                          src="http://apache.org/favicon.ico"
                                                                          alt="apache favicon"> htaccess</a></li>
                    <li><a href="http://httpd.apache.org/docs/current/mod/mod_rewrite.html"
                           title="Read about mod_rewrite at apache.org"><img width="16px"
                                                                             src="http://apache.org/favicon.ico"
                                                                             alt="apache favicon"> mod_rewrite</a></li>
                </ul>
            </td>
        </tr>
    </table>
</div>