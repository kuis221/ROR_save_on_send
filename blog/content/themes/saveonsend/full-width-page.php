<?php
/*
Template Name: Full Width Layout
*/
get_header(); ?>

<section class="text-left">
	<div class="container">

		<?php if (have_posts()) : while (have_posts()) : the_post(); ?>
			<div class="row content">
				<div class="post col-md-12" id="post-<?php the_ID(); ?>">
	
					<h2 class="entry-title"><?php the_title(); ?></h2>	
					<div class="entry">
	
						<?php the_content(); ?>
						<?php wp_link_pages(array('before' => 'Pages: ', 'next_or_number' => 'number')); ?>
	
					</div>
				</div>
			</div>
		
			<?php //comments_template(); ?>
		<?php endwhile; endif; ?>
		
	</div>
</section>

<?php get_footer(); ?>
