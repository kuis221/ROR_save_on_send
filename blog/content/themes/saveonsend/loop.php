<?php if ( is_active_sidebar( 'primary' ) ) {
	$romangie_content_class = "col-sm-11 content format-" . get_post_format();
} else {
	$romangie_content_class = "col-sm-11 col-md-8 content format-" . get_post_format();
}
?>

<?php if (is_single()): the_post() ?>

	<?php $romangie_countComments = wp_count_comments(get_the_ID()); ?>

	<article id="post-<?php the_ID(); ?>" <?php post_class('row post-roll'); ?>>
		<div class="col-sm-1 meta info hidden-xs">
			<a href="<?php the_permalink(); ?>" rel="bookmark" title="<?php printf( __('Permalink to %s', 'romangie'), get_the_title()); ?>">
				<?php 
				if( has_post_format( ' quote' ) ) {
					echo '<i class="metaicon fa fa-quote-right"></i>';
				} elseif ( has_post_format( 'status' ) ) {
					echo '<i class="metaicon fa fa-pencil"></i>';
				} elseif ( has_post_format( 'video' ) ) {
					echo '<i class="metaicon fa fa-film"></i>';
				} elseif ( has_post_format( 'audio' ) ) {
					echo '<i class="metaicon fa fa-volume-up"></i>';
				} elseif ( has_post_format( 'chat' ) ) {
					echo '<i class="metaicon fa fa-comments-o"></i>';
				} elseif ( has_post_format( 'image' ) ) {
					echo '<i class="metaicon fa fa-picture-o"></i>';
				} elseif ( has_post_format( 'gallery' ) ) {
					echo '<i class="metaicon fa fa-folder-o"></i>';
				} elseif ( has_post_format( 'link' ) ) {
					echo '<i class="metaicon fa fa-link"></i>';
				} elseif ( has_post_format( 'aside' ) ) {
					echo '<i class="metaicon fa fa-bars"></i>';
				} else {
					echo '<i class="metaicon fa fa-file-text-o"></i>';
				}
				?>
			</a>
		</div>
		<div class="<?php echo $romangie_content_class; ?>">
			<h2 class="entry-title">
				<?php the_title(); ?>
			</h2>
			<div class="additional-meta">
				<p>
					<i class="fa fa-calendar"></i><time datetime="<?php echo get_the_date('o-m-d'); ?>" class="date updated" pubdate><?php echo get_the_date(); ?></time> &mdash;
					Posted by
					<i class="fa fa-user"></i><a href="<?php echo get_author_posts_url( get_the_author_meta( 'ID' ) );?>" class="vcard author"><span class="fn"><?php the_author(); ?></span></a>
					<?php if ( has_category() ) { ?>
						 to
						<?php _e('', 'romangie' ); ?><?php the_category(', '); ?>
					<?php } ?>
					&nbsp;&nbsp;|&nbsp;&nbsp;
					<i class="fa fa-comment-o"></i><a href="<?php the_permalink(); ?>#comments" rel="bookmark" title="<?php _e('Go to comment section', 'romangie'); ?>"><?php printf( _n( '%1$s Comment', '%1$s Comments', get_comments_number(), 'romangie' ), number_format_i18n( get_comments_number() ), '<span>' . get_the_title() . '</span>' ); ?></a>
				</p>
				<?php edit_post_link(__( 'Edit this entry', 'romangie') , '<p>', '</p>'); ?>
			</div>
			<div class="entry entry-content">
				<?php if ( has_post_thumbnail() ) { the_post_thumbnail( 'full' ); }
					the_content('Continue Reading <i class="fa fa-chevron-right"></i>'); ?>
			</div>
			<?php wp_link_pages( array( 'before' => '<div class="page-links"><span class="page-links-title">' . __( 'Pages:', 'romangie' ) . '</span>', 'after' => '</div>', 'link_before' => '<span>', 'link_after' => '</span>' ) ); ?>
		</div>
		<div id="comments" class="col-sm-offset-1 col-sm-10 comments">
			<?php comments_template( '', true ); ?>
		</div>
	</article>

<?php else: ?>

	<?php if (have_posts()):
		while (have_posts()) : the_post() ?>

			<?php $romangie_countComments = wp_count_comments(get_the_ID()); ?>

			<article id="post-<?php the_ID(); ?>" <?php post_class('row post-roll'); ?>>
				<div class="col-sm-1 meta info hidden-xs">
					<a href="<?php the_permalink(); ?>" rel="bookmark" title="<?php printf( __('Permalink to %s', 'romangie'), get_the_title()); ?>">
						<?php 
						if( has_post_format( ' quote' ) ) {
							echo '<i class="metaicon fa fa-quote-right"></i>';
						} elseif ( has_post_format( 'status' ) ) {
							echo '<i class="metaicon fa fa-pencil"></i>';
						} elseif ( has_post_format( 'video' ) ) {
							echo '<i class="metaicon fa fa-film"></i>';
						} elseif ( has_post_format( 'audio' ) ) {
							echo '<i class="metaicon fa fa-volume-up"></i>';
						} elseif ( has_post_format( 'chat' ) ) {
							echo '<i class="metaicon fa fa-comments-o"></i>';
						} elseif ( has_post_format( 'image' ) ) {
							echo '<i class="metaicon fa fa-picture-o"></i>';
						} elseif ( has_post_format( 'gallery' ) ) {
							echo '<i class="metaicon fa fa-folder-o"></i>';
						} elseif ( has_post_format( 'link' ) ) {
							echo '<i class="metaicon fa fa-link"></i>';
						} elseif ( has_post_format( 'aside' ) ) {
							echo '<i class="metaicon fa fa-bars"></i>';
						} else {
							echo '<i class="metaicon fa fa-file-text-o"></i>';
						}
						?>
					</a>
				</div>
				<div class="<?php echo $romangie_content_class; ?>">
					<h2 class="entry-title">
						<a href="<?php the_permalink(); ?>" rel="bookmark" title="<?php printf( __('Permalink to %s', 'romangie'), get_the_title()); ?>"><?php the_title(); ?></a>
					</h2>
					<div class="additional-meta">
						<p>
							<i class="fa fa-calendar"></i><time datetime="<?php echo get_the_date('o-m-d'); ?>" class="date updated" pubdate><?php echo get_the_date(); ?></time> &mdash;
							Posted by
							<i class="fa fa-user"></i><a href="<?php echo get_author_posts_url( get_the_author_meta( 'ID' ) );?>" class="vcard author"><span class="fn"><?php the_author(); ?></span></a>
							<?php if ( has_category() ) { ?>
								 to
								<?php _e('', 'romangie' ); ?><?php the_category(', '); ?>
							<?php } ?>
							&nbsp;&nbsp;|&nbsp;&nbsp;
							<i class="fa fa-comment-o"></i><a href="<?php the_permalink(); ?>#comments" rel="bookmark" title="<?php _e('Go to comment section', 'romangie'); ?>"><?php printf( _n( '%1$s Comment', '%1$s Comments', get_comments_number(), 'romangie' ), number_format_i18n( get_comments_number() ), '<span>' . get_the_title() . '</span>' ); ?></a>
						</p>
						<?php edit_post_link(__( 'Edit this entry', 'romangie') , '<p>', '</p>'); ?>
					</div>
					<div class="entry entry-summary">
						<?php if ( has_post_thumbnail() ) { the_post_thumbnail( 'full' ); }
							the_content( __('Continue Reading', 'romangie') . '<i class="fa fa-chevron-right"></i>'); ?>
					</div>
					<?php wp_link_pages( array( 'before' => '<div class="page-links"><span class="page-links-title">' . __( 'Pages:', 'romangie' ) . '</span>', 'after' => '</div>', 'link_before' => '<span>', 'link_after' => '</span>' ) ); ?>
				</div>
			</article>

		<?php endwhile; ?>
	<?php else: ?>

		<p>Nothing matches your query.</p>

	<?php endif; ?>

<?php endif; ?>