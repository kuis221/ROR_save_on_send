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
						<?php if (is_category()) { ?>
							<h4 class="text-center"><?php _e('Category Archives: ', 'romangie'); single_cat_title(); ?></h4>
						<?php } elseif( is_tag() ) { ?>
							<h4 class="text-center"><?php _e('Tag Archives: ', 'romangie'); single_tag_title(); ?></h4>
						<?php } elseif (is_day()) { ?>
							<h4 class="text-center"><?php _e('Daily Archives:', 'romangie'); the_time('F jS, Y'); ?></h4>	
						<?php } elseif (is_month()) { ?>
							<h4 class="text-center"><?php _e('Monthly Archives: ', 'romangie'); the_time('F, Y'); ?></h4>
						<?php } elseif (is_year()) { ?>
							<h4 class="text-center"><?php _e('Yearly Archives: ', 'romangie'); the_time('Y'); ?></h4>
						<?php } elseif (is_author()) { ?>
							<h4 class="text-center"><?php _e('Author Archives: ', 'romangie'); the_author(); ?></h4>
						<?php } elseif (isset($_GET['paged']) && !empty($_GET['paged'])) { ?>
							<h4 class="text-center"><?php _e('Blog Archives:', 'romangie'); ?></h4>
						<?php } ?>
					</div>

					<?php get_template_part('loop', 'archive'); ?>

				<?php else : ?>

					<h2><?php _e( 'Not Found', 'romangie'); ?></h2>

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