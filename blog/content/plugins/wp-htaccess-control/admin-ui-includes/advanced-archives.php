<?php global $WPhtc;?>
<!-- Advanced Archives -->
<div class="wphtc-section">
    <div class="wphtc-section-title stuffbox">
        <div title="Click to toggle" class="handlediv"
             style="background:url('<?php bloginfo("wpurl") ?>/wp-admin/images/menu-bits.gif') no-repeat scroll left -111px transparent">
            <br></div>
        <h3><?php _e('Advanced Archives', 'wp-htaccess-control'); ?></h3>
    </div>
    <table class="form-table wphtc-inputs">
        <?php foreach (get_taxonomies('', 'objects') as $taxonomy) {
            if (!$taxonomy->rewrite) {
                continue;
            }
            ?>
            <tr valign="top">
                <th scope="row" style="width:18%;"><?php _e('Create', 'wp-htaccess-control');
                    echo " " . $taxonomy->labels->name . " ";
                    _e('Archives', 'wp-htaccess-control'); ?></th>
                <td>
                    <input type="checkbox"
                           name="WPhtc_create_archive[<?php echo $taxonomy->name; ?>]" <?php if ($WPhtc->get_data('create_archive', $taxonomy->name)) {
                        echo "checked=checked";
                    } ?> />
                </td>
                <td valign="middle">
                    <p class="description"><?php _e('If active, taxonomy-based archives will be accessible:', 'wp-htaccess-control'); ?></p>

                    <p class="description"><code><?php bloginfo('url') ?>/<?php echo $taxonomy->name; ?>
                            _base/<?php echo $taxonomy->name; ?>_term/2010</code></p>

                    <p class="description"><code><?php bloginfo('url') ?>/<?php echo $taxonomy->name; ?>
                            _base/<?php echo $taxonomy->name; ?>_term/2010/12</code></p>

                    <p class="description"><?php _e("This will also work if you've removed the", 'wp-htaccess-control'); ?> <?php echo $taxonomy->labels->name; ?> <?php _e("base.", 'wp-htaccess-control'); ?></p>
                </td>
            </tr>
        <?php
        }
        ?>
    </table>
</div>