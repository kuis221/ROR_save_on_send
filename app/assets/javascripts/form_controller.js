$(document).ready(function() {

	// Date picker
	var d = new Date(),
		minDate = (d.getMonth() + 1) + "/" + (d.getDate() + 1) + "/" + (d.getFullYear() - 1),
		maxDate = (d.getMonth() + 1) + "/" + d.getDate() + "/" + d.getFullYear();

	$('.input-group.date').datetimepicker({
	    minDate: minDate,
	    maxDate: maxDate,
	    showToday: true,
	    pickTime: false
	});



    $('[name="user_next_transfer[receive_currency]"]').click(function() {
    	$('#amount_receive_currency').html($('<i class="fa fa-fw fa-'+$(this).val().toLowerCase()+'">'));
    });


    $('[href="#apply_payment_methods"]').click(function() {
		$('#user_next_transfer_originating_source_of_funds_id_' + $('.send_method_id', $(this).parent()).text()).attr('checked', true);
		$('#user_next_transfer_destination_preference_for_funds_id_' + $('.receive_method_id', $(this).parent()).text()).attr('checked', true);
		$('form.user_next_transfer').submit();
    });


    $('[name="user_next_transfer[money_transfer_destination_id]"]').change(function(event) {
		var country = $(this).data('country');
		  
		$('#amount_receive_currency').html('');
		
		if (country == 'india') {
			$('#amount_receive_currency').html($('<i class="fa fa-fw fa-inr">'));	  	
		}
		if (country == 'mexico') {
			$('#amount_receive_currency').html($('<i class="fa fa-fw fa-mxn">'));	  	
		}
		  
		$('.receive_currency').addClass('hidden');
		$('#receive_currency_' + country).removeClass('hidden');
    });
});