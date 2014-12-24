$(document).on 'click', '[name="user_recent_transaction[currency]"]', (event) ->
    $('#amount_received_currency').html($('<i class="fa fa-fw fa-'+$(this).val().toLowerCase()+'">'))

$(document).on 'change', '[name="user_recent_transaction[money_transfer_destination_id]"]', (event) ->
  country = event.currentTarget.id
  
  $('#amount_receive_currency').html('')

  if country == 'india'
    $('#amount_received_currency').html($('<i class="fa fa-fw fa-inr">'))
  
  if country == 'mexico'
    $('#amount_received_currency').html($('<i class="fa fa-fw fa-mxn">'))
  
  $('.receive_currency').addClass('hidden')
  $('#receive_currency_' + event.currentTarget.id).removeClass('hidden')
