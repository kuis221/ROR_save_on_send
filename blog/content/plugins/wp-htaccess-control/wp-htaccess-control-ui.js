jQuery(document).ready(function(){
	collapseSections();
	editWPhtaJM();
	function collapseSections(){
		jQuery("#wphtc-main .wphtc-inputs,.wphtc-section-title a").not(".wphtc-inputs.start-open").hide();
		jQuery(".handlediv").fadeOut(0);
		jQuery("#wphtc-main .wphtc-section").hover(
			function(){
				jQuery(this).find(".handlediv").fadeIn(150);
				},
			function(){
				jQuery(this).find(".handlediv").fadeOut(150);
				}
			)
		jQuery("#wphtc-main .wphtc-section:not(.permanently-open) .wphtc-section-title h3").click(
			function(){
				if(jQuery(this).parent().find("a")){
					jQuery(this).parent().find("a").toggle();
					}
				jQuery(this).parent().next(".wphtc-inputs").toggle();
				}
			);
		}
	function editWPhtaJM(){
		jQuery("input[name='WPhtc_jim_morgan_hta']").click(
			function(){
				if(jQuery("textarea[name='WPhtc_wp_hta']").attr('readonly')==true){
					jQuery("textarea[name='WPhtc_wp_hta']").text('').removeAttr("readonly").removeClass('readonly');
					}
				else{
					jQuery("textarea[name='WPhtc_wp_hta']").addClass('readonly');
					}
				}
			);
		}
	});