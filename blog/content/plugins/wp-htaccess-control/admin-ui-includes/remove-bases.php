<?php global $WPhtc;?>
<!-- Remove Taxonomies and Author Base -->
<div class="wphtc-section">
    <div class="wphtc-section-title stuffbox">
        <div title="Click to toggle" class="handlediv"
             style="background:url('<?php bloginfo("wpurl") ?>/wp-admin/images/menu-bits.gif') no-repeat scroll left -111px transparent">
            <br></div>
        <h3><?php _e('Remove Taxonomies and Author Base', 'wp-htaccess-control'); ?></h3>
    </div>
    <table class="form-table wphtc-inputs">
        <!-- Remove Author Base -->
        <tr valign="top">
            <th scope="row" style="width:18%;"><?php _e('Remove Author Base', 'wp-htaccess-control'); ?></th>
            <td>
                <input type="checkbox"
                       name="WPhtc_remove_author_base" <?php if ($WPhtc->get_data('remove_author_base')) {
                    echo "checked=checked";
                } ?> />
            </td>
            <td valign="middle">
                <p class="description"><?php _e('If active, the author base will be removed from permalinks:'); ?></p>

                <p class="description"><code><?php bloginfo('url') ?>
                        /<?php _e('the-author', 'wp-htaccess-control'); ?></code></p>

                <p class="description">
                    <strong><?php _e('Beware:'); ?></strong> <?php _e('This could conflict with the removal of the category base on a situation where a category slug is the same as a user nicename.'); ?>
                </p>
            </td>
        </tr>
        <!-- Remove Taxonomies Base -->
        <?php foreach (get_taxonomies('', 'objects') as $taxonomy) {
            if (!$taxonomy->rewrite) {
                continue;
            }
            ?>
            <tr valign="top">
                <th scope="row" style="width:18%;"><?php _e('Remove', 'wp-htaccess-control');
                    echo " " . $taxonomy->labels->name . " ";
                    _e('Base', 'wp-htaccess-control'); ?></th>
                <td>
                    <input type="checkbox"
                           name="WPhtc_remove_base[<?php echo $taxonomy->name; ?>]" <?php if ($WPhtc->get_data('remove_taxonomy_base', $taxonomy->name)) {
                        echo "checked=checked";
                    } ?> />
                </td>
                <td valign="middle">
                    <p class="description"><?php _e('If active, the');
                        echo " " . $taxonomy->labels->name . " ";
                        _e('base will be removed from permalinks:'); ?></p>

                    <p class="description"><code><?php bloginfo('url') ?>/<?php echo $taxonomy->name; ?>_term</code></p>

                    <p class="description">
                        <strong><?php _e('Beware:'); ?></strong> <?php _e('This could conflict with the removal of the other permalink bases on a situation where a term slug is the same.'); ?>
                    </p>
                </td>
            </tr>
        <?php
        }
        ?>
    </table>
</div>