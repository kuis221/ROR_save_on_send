$(document).on 'change', 'select#user_next_transfer_receive_currency', (event) ->
    $('#amount_receive_currency').text($(this).val())
