$(document).ready ->
  $('select#user_recent_transaction_currency').on 'change', (event) ->
    $('#amount_received_currency').text($(this).val())
