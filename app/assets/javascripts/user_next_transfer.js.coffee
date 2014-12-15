$(document).on 'click', '[name="user_next_transfer[receive_currency]"]', (event) ->
    $('#amount_receive_currency').html($('<i class="fa fa-fw fa-'+$(this).val().toLowerCase()+'">'))

$(document).on 'click', '[href="#apply_payment_methods"]', (event) ->
  $('#user_next_transfer_originating_source_of_funds_id_' + $('.send_method_id', $(this).parent()).text())
    .attr('checked', true)
  $('#user_next_transfer_destination_preference_for_funds_id_' + $('.receive_method_id', $(this).parent()).text())
    .attr('checked', true)
  $('form.user_next_transfer').submit()
