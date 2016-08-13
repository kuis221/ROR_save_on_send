		<div id="sidebar" class="sidebar-offcanvas">
            <?php $romangie_defaults = array(
                'theme_location' => 'header-menu',
                'container' => 'ol',
                'menu_class' => 'nav nav-pills nav-stacked'
                );
            wp_nav_menu($romangie_defaults); ?>
		</div>
	</div>
</div>

<!--footer-->
<div class="siteinfo">
	<div class="container-fluid">
		<div class="row feedback">
			<div class="col-xs-12">
				<h3>Help others too!</h3>
				<p>Share your experience. Help us improve the site and help others.</p>
				<p><a href="mailto:admin@saveonsend.com">Tell us how we can get better</a></p>
			</div>
		</div>
		<div class="row follow-buttons">
			<div class="col-xs-12">
				<a class="follow-button-facebook" title="Follow on Facebook" href="//www.facebook.com/saveonsend" target="_blank">
					<i class="fa fa-facebook"></i>
					<span class="follow-button-label">Facebook</span>
				</a>
				<a class="follow-button-twitter" title="Follow on Twitter" href="//twitter.com/intent/follow?source=followbutton&amp;variant=1.0&amp;screen_name=SaveOnSend" target="_blank">
					<i class="fa fa-twitter"></i>
					<span class="follow-button-label">Twitter</span>
				</a>
				<a class="follow-button-linkedin" title="Follow on LinkedIn" href="//www.linkedin.com/company/saveonsend" target="_blank">
					<i class="fa fa-linkedin"></i>
					<span class="follow-button-label">LinkedIn</span>
				</a>
				<a class="follow-button-google" title="Follow on Google" href="//plus.google.com/+Saveonsend" target="_blank" rel="publisher">
					<i class="fa fa-google-plus"></i>
					<span class="follow-button-label">Google</span>
				</a>
				<a class="follow-button-tumblr" title="Follow on Tumblr" href="http://saveonsend.tumblr.com" target="_blank">
					<i class="fa fa-tumblr"></i>
					<span class="follow-button-label">Tumblr</span>
				</a>
			</div>
		</div>
		<div class="row footer">
			<div class="col-xs-12">
				<p>
					&copy;2015 SaveOnSend Inc.&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;
					<a href="/terms">Terms</a>
					&nbsp;&nbsp;|&nbsp;&nbsp;
					<a href="/privacy">Privacy</a>
					&nbsp;&nbsp;|&nbsp;&nbsp;
					<a href="/how-to">How it works</a>
				</p>
			</div>			
		</div>
		<div class="row disclosure">
			<div class="col-xs-12 col-sm-10 col-sm-offset-1">
				<p>Advertising Disclosure: SaveOnSend.com is an independent, advertising-supported comparison service. SaveOnSend may be compensated in exchange for featured placement of certain sponsored products and services, or your clicking on links posted on this website.</p>
			</div>
		</div>
	</div>
</div>
<!--endfooter-->


<?php if (  is_single()  ) { ?>
	<!--share-->
	<div class="share">
		<ul class="rrssb-buttons">
			<li class="rrssb-facebook">
				<a rel="nofollow" href="http://api.addthis.com/oexchange/0.8/forward/facebook/offer?url=<?php echo current_page_url(); ?>&pubid=ra-552e8c035645c583" class="popup">
					<i class="fa fa-facebook"></i>
				</a>
			</li>
			<li class="rrssb-twitter">
				<a rel="nofollow" href="http://api.addthis.com/oexchange/0.8/forward/twitter/offer?url=<?php echo current_page_url(); ?>&pubid=ra-552e8c035645c583&amp;via=saveonsend" class="popup">
					<i class="fa fa-twitter"></i>
				</a>
			</li>
			<li class="rrssb-googleplus">
				<a rel="nofollow" href="http://api.addthis.com/oexchange/0.8/forward/googleplus/offer?url=<?php echo current_page_url(); ?>&pubid=ra-552e8c035645c583" class="popup">
					<i class="fa fa-google-plus"></i>
				</a>
			</li>
			<li class="rrssb-tumblr">
				<a rel="nofollow" href="http://api.addthis.com/oexchange/0.8/forward/tumblr/offer?url=<?php echo current_page_url(); ?>&pubid=ra-552e8c035645c583" class="popup">
					<i class="fa fa-tumblr"></i>
				</a>
			</li>
			<li class="rrssb-linkedin">
				<a rel="nofollow" href="http://api.addthis.com/oexchange/0.8/forward/linkedin/offer?url=<?php echo current_page_url(); ?>&pubid=ra-552e8c035645c583" class="popup">
					<i class="fa fa-linkedin"></i>
				</a>
			</li>
			<li class="rrssb-others">
				<a rel="nofollow" href="http://api.addthis.com/oexchange/0.8/offer?url=<?php echo current_page_url(); ?>&pubid=ra-552e8c035645c583" class="popup">
					<i class="fa fa-plus"></i>
				</a>
			</li>
		</ul>
	</div>
	<!--endshare-->
<?php } ?>

<?php wp_footer(); ?>
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-552e8c035645c583" async="async"></script>
</body>
</html>