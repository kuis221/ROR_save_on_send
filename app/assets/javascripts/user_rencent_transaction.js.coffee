$(document).on 'click', '[name="user_recent_transaction[currency]"]', (event) ->
    $('#amount_received_currency').html($('<i class="fa fa-fw fa-'+$(this).val().toLowerCase()+'">'))

$(document).on 'click', '[data-toggle-amount]', (event) ->
	$('[data-target-amount]').each ->
		$(this).addClass('hide')
	$('[data-target-amount="'+$(this).data('toggle-amount')+'"]').removeClass('hide')
