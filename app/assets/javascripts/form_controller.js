(function($){
	var self = window.form = {
		
		data : {
			country : 0
		},
		
		init : function() {

			// Date picker
			var d = new Date(),
				minDate = (d.getMonth() + 1) + "/" + (d.getDate() + 1) + "/" + (d.getFullYear() - 1),
				maxDate = (d.getMonth() + 1) + "/" + (d.getDate() + 1) + "/" + d.getFullYear();
				
			$('.input-group.date').datetimepicker({
			    minDate: minDate,
			    maxDate: maxDate,
				format: 'MM/DD/YYYY',
                icons: {
                    previous: "fa fa-chevron-left",
                    next: "fa fa-chevron-right"
                }
			});
			
			
			// If error message exists
			if ($('.alert.alert-danger').data('error') == 1) {
				$('html, body').animate({
					scrollTop: $(".alert.alert-danger").offset().top
				}, 1000);
			}

			
			// Expand menu on mobile
			$('[data-toggle="offcanvas"]').click(function () {
				$('.row-offcanvas').toggleClass('active');
			});
			

			// Set initial values
			self.data.country = $('[name="user_next_transfer[money_transfer_destination_id]"]:checked').val();
	    	self.show_hide_receive_currency();
			

			// Choose received currency
		    $('[name="user_next_transfer[receive_currency]"]').click(function() {
		    	$('#amount_receive_currency').html($('<i class="fa fa-fw fa-'+$(this).val().toLowerCase()+'">'));
		    });

		    $('[name="user_recent_transaction[currency]"]').click(function() {
		    	$('#amount_receive_currency').html($('<i class="fa fa-fw fa-'+$(this).val().toLowerCase()+'">'));
		    });
		

			// Link from output table		
		    $('[href="#apply_payment_methods"]').click(function() {
				$('#user_next_transfer_originating_source_of_funds_id_' + $('.send_method_id', $(this).parent()).text()).attr('checked', true);
				$('#user_next_transfer_destination_preference_for_funds_id_' + $('.receive_method_id', $(this).parent()).text()).attr('checked', true);
				$('form.user_next_transfer').submit();
		    });
		

			// Change destination
		    $('[name="user_next_transfer[money_transfer_destination_id]"]').change(function() {
		    	self.distination_change(this);
		    	self.show_hide_receive_currency();
		    });

		    $('[name="user_recent_transaction[money_transfer_destination_id]"]').change(function() {
		    	self.distination_change(this);
		    	self.show_hide_receive_currency();
		    });
		    
		    
		    // Capitalize first letter
		    $('textarea.text-capitalize').capitalize();
		},
		
		// Show or hide receive currency
		show_hide_receive_currency : function() {
			$('.receive_currency').addClass('hidden');
			$('#receive_currency_' + self.data.country).removeClass('hidden');
		},
		
		// Change distination
		distination_change : function(el) {
			self.data.country = $(el).val();
			  
			$('#amount_receive_currency').html('');
			
			if (self.data.country == 2) {
				$('#amount_receive_currency').html($('<i class="fa fa-fw fa-inr">'));	  	
			}
			if (self.data.country == 3) {
				$('#amount_receive_currency').html($('<i class="fa fa-fw fa-mxn">'));	  	
			}
		}
	};

    // Onload
    $(self.init);

})(jQuery);