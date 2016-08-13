<?php get_header(); ?>
<?php if ( is_active_sidebar( 'primary' ) ) {
	$romangie_left_col_class = "col-md-9 indexpage";
	$romangie_right_col_class= "col-md-3 visible-lg visible-md";
} else {
	$romangie_left_col_class = "col-md-12 indexpage";
	$romangie_right_col_class= "hidden-xs";
}
?>
<section class="text-left">
	<div class="container">
		<div class="row">
			<div class="<?php echo $romangie_left_col_class; ?>">

				<?php if (have_posts()) : ?>

		 			<?php $post = $posts[0]; ?>

					<div id="title_archives" class="entry-title">
						<h4 class="text-center"><?php printf( __( 'Search Results for: %s', 'twentythirteen' ), get_search_query() ); ?></h4>
					</div>

					<?php get_template_part('loop', 'search'); ?>

				<?php else : ?>

					<h2><?php _e('Not Found', 'romangie') ?></h2>

				<?php endif; ?>

				<div class="pagenav page-links row">
					<div class="next-posts pagination-item col-xs-6 col-sm-offset-1 col-sm-5"><?php next_posts_link('&laquo; ' . __('Older Entries', 'romangie') ) ?></div>
					<div class="prev-posts pagination-item col-xs-6 col-sm-offset-1 col-sm-5"><?php previous_posts_link( __('Newer Entries', 'romangie') . ' &raquo;') ?></div> 
				</div>
			</div>
			<div class="<?php echo $romangie_right_col_class; ?>">
				<?php get_sidebar('primary'); ?>
			</div>
		</div>
	</div>
</section>

<?php get_footer(); ?>