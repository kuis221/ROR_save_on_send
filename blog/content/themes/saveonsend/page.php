<?php get_header(); ?>

<section class="text-left">
	<div class="container">
		<div class="row">
			<div class="col-md-offset-1 col-md-9">

				<?php if (have_posts()) : while (have_posts()) : the_post(); ?>
					<div id="post-<?php the_ID(); ?>" <?php post_class('row post-roll'); ?>>
						<div class="post col-sm-offset-1 col-sm-11" id="post-<?php the_ID(); ?>">

							<h2 class="entry-title"><?php the_title(); ?></h2>
							<div class="additional-meta">
								<?php edit_post_link(__( 'Edit this entry', 'romangie') , '<p>', '</p>'); ?>
							</div>
							<div class="entry">
		
								<?php the_content(); ?>
								<?php wp_link_pages( array( 'before' => '<div class="page-links"><span class="page-links-title">' . __( 'Pages:', 'romangie' ) . '</span>', 'after' => '</div>', 'link_before' => '<span>', 'link_after' => '</span>' ) ); ?>
		
							</div>
						</div>
					</div>
				<?php endwhile; endif; ?>

			</div>
		</div>
	</div>
</section>

<?php get_footer(); ?>
