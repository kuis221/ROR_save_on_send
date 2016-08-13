<?php

if ( post_password_required() )
	return;
?>

<?
/*<div id="comments" class="comments-area">
	<?php if ( have_comments() ) : ?>
		<h2 class="comments-title">
			<?php
				printf( _n( '%1$s Comment', '%1$s Comments', get_comments_number(), 'romangie' ),
					number_format_i18n( get_comments_number() ), '<span>' . get_the_title() . '</span>' );
			?>
		</h2>
        
        <?php
		if ( ! comments_open() && get_comments_number() ) : ?>
			<p class="nocomments"><?php _e( 'Comments are closed.' , 'romangie' ); ?></p>
		<?php endif; ?>

	<?php endif; // have_comments() ?>

	<div class="form-group form-group-lg">
		<?php $comment_args = array( 'title_reply'=>__('Got Something To Say:', 'romangie'),
									 'fields' => apply_filters( 'comment_form_default_fields', 
			 						 array(
										'author' => '<p class="comment-form-author">' . '<label for="author">' . __( 'Name' , 'romangie') . '</label> ' . ( $req ? '<span class="required">*</span>' : '' ) .'<input id="author" class="form-control" name="author" type="text" value="' . esc_attr( $commenter['comment_author'] ) . '" size="30"/></p>', 
										'email'  => '<p class="comment-form-email">' . '<label for="email">' . __( 'Email' , 'romangie') . '</label> ' . ( $req ? '<span class="required">*</span>' : '' ) . '<input id="email" class="form-control" name="email" type="text" value="' . esc_attr(  $commenter['comment_author_email'] ) . '" size="30"/>'.'</p>', 
										'url' => '<p class="comment-form-url">' . '<label for="url">' . __( 'Website' , 'romangie') . '</label> <input id="url" name="url" type="text" class="form-control" value="' . esc_attr( $commenter['comment_author_url'] ) . '" size="30"/></p>' ) 
   									 ),
   									 'comment_field' => '<p>' . '<label for="comment">' . __( 'Let us know what you have to say:' , 'romangie') . '</label>' . '<textarea id="comment" name="comment" cols="40" rows="6" class="form-control" style="width: 100%" aria-required="true"></textarea>' . '</p>',
									 'comment_notes_after' => '',
									 'class_submit' => 'btn btn-primary btn-lg'
							  );
		comment_form($comment_args); ?>
	</div>
	<div class="commentlist comment-content">
		<?php wp_list_comments('type=comment&callback=romangie_magazin_comment'); ?>
		<?php wp_list_comments('type=pings&callback=romangie_magazin_comment'); ?>
	</div>	
	<div class="navigation">
		<div class="alignleft"><?php previous_comments_link() ?></div>
		<div class="alignright"><?php next_comments_link() ?></div>
	</div>
</div>*/
?>