$(document).on 'click', '[name="user_next_transfer[receive_currency]"]', (event) ->
  $('#amount_receive_currency').html($('<i class="fa fa-fw fa-'+$(this).val().toLowerCase()+'">'))

$(document).on 'click', '[href="#apply_payment_methods"]', (event) ->
  $('#user_next_transfer_originating_source_of_funds_id_' + $('.send_method_id', $(this).parent()).text())
    .attr('checked', true)
  $('#user_next_transfer_destination_preference_for_funds_id_' + $('.receive_method_id', $(this).parent()).text())
    .attr('checked', true)
  $('form.user_next_transfer').submit()

$(document).on 'change', '[name="user_next_transfer[money_transfer_destination_id]"]', (event) ->
  country = event.currentTarget.id
  
  $('#amount_receive_currency').html('')

  if country == 'india'
    $('#amount_receive_currency').html($('<i class="fa fa-fw fa-inr">'))
  
  if country == 'mexico'
    $('#amount_receive_currency').html($('<i class="fa fa-fw fa-mxn">'))
  
  $('.receive_currency').addClass('hidden')
  $('#receive_currency_' + event.currentTarget.id).removeClass('hidden')
