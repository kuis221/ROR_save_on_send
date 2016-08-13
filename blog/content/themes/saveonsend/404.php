<?php get_header(); ?>

<section class="text-left">
	<div class="container">
		<div class="row">
			<div class="col-xs-12">
				<div id="error_message">
					<h1 class="error_message" style="font-size: 100px; margin-bottom: 60px"><?php _e('We\'re sorry', 'romangie'); ?></h1>
					<h2 style="font-size: 30px; margin-bottom: 20px"><?php _e('The page or article you are looking for cannot be found.', 'romangie'); ?></h2>
					<h2 style="text-align: center; font-size: 30px"><a href="<?php echo home_url(); ?>"><?php _e( 'Return to the homepage', 'romangie'); ?></a></h2>
				</div>
			</div>
		</div>
	</div>
</div>

<?php get_footer(); ?>




