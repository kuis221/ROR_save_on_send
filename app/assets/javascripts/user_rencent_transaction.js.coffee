$(document).on 'change', 'select#user_recent_transaction_currency', (event) ->
    $('#amount_received_currency').text($(this).val())
