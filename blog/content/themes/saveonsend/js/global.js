require.config({
	baseUrl: "content/themes/saveonsend/js",
	paths: {
		jquery: "../bower_components/jquery/dist/jquery.min",
		bootstrap: "../bower_components/bootstrap-sass-official/assets/javascripts/bootstrap.min",
		rrssb: "../bower_components/rrssb/js/rrssb.min"
	}
});

require(["jquery", "bootstrap", "rrssb"], function($) {
	var self = window.form = {
		
		init : function() {

			// Expand menu on mobile
			$('[data-toggle="offcanvas"]').click(function () {
				$('.row-offcanvas').toggleClass('active');
			});

		}
	};

    // Onload
    $(self.init);
});
