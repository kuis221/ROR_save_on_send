<!DOCTYPE html>
<html <?php language_attributes(); ?>>
    <head>
        <meta charset="<?php bloginfo( 'charset' ); ?>" />
        <title><?php wp_title( '|', true, 'right' ); ?></title>
        <meta name="viewport" content="width=device-width">
        <link rel="profile" href="//gmpg.org/xfn/11" />
        <link rel="pingback" href="<?php bloginfo( 'pingback_url' ); ?>" />
        <link href="/blog/apple-touch-icon.png" rel="apple-touch-icon" sizes="180x180" type="image/png" />
        <link href="/blog/favicon.png" rel="shortcut icon" type="image/x-icon" />
		<?php wp_head(); ?>
		<script type="application/ld+json">{"@context":"http:\/\/schema.org","@type":"Blog","name":"Before you Transfer Money | SaveOnSend Blog","headline": "Before you Transfer Money - Save On Send","about": "Before you Transfer Money","description": "Learn about your options when sending money online, before you transfer money. We always publish articles remittance customers need to know about.","inLanguage": "en-US","publisher": {"@type": "Organization","name": "SaveOnSend"},"license": "http:\/\/creativecommons.org\/licenses\/by-nc-sa\/3.0\/us\/deed.en_US","dateCreated": "2015-05-01","isFamilyFriendly": "Yes","typicalAgeRange": "25-","educationalUse": "reference"}</script>
    </head>
    <body <?php body_class( ); ?>>
        <div class="container-fluid">
			<div class="row notification">
				<div class="container">
					<div class="row">
						<div class="col-xs-12 text-left">	
							<p>
								This is a test version &mdash; we need your feedback to get it right! Write to
								<a href="mailto:admin@saveonsend.com">admin@saveonsend.com</a>
							</p>
						</div>
					</div>				
				</div>	
			</div>
			<div class="row row-offcanvas row-offcanvas-right">
				<header id="header">
					<div class="navbar navbar-default">
						<div class="container">
							<div class="navbar-header">
								<button class="navbar-toggle collapsed" data-toggle="offcanvas" type="button">
									<span class="sr-only">Toggle navigation</span>
									<span class="icon-bar"></span>
									<span class="icon-bar"></span>
									<span class="icon-bar"></span>
								</button>
	
								<a href="//www.saveonsend.com" class="navbar-brand">
									<img width="272" title="<?php bloginfo('name'); ?>" src="<?php echo get_bloginfo('template_url');?>/images/logo.png" class="img-responsive" alt="<?php bloginfo('name'); ?>">
								</a>
							</div>
							<div id="navbar" class="collapse navbar-collapse">
		                        <?php $romangie_defaults = array(
		                            'theme_location' => 'header-menu',
		                            'container' => 'ol',
		                            'menu_class' => 'nav nav-pills navbar-right'
		                            );
		                        wp_nav_menu($romangie_defaults); ?>
							</div>
						</div>
					</div>
				</header>
				<section class="content-header">
					<div class="container">
						<div class="row">
							<div class="col-xs-12">
								<h2>
									<a href="<?php echo esc_url( home_url( '/' ) ); ?>" title="<?php bloginfo('description'); ?>">
										<?php bloginfo('description'); ?>
									</a>
								</h2>
							</div>
						</div>
					</div>					
				</section>