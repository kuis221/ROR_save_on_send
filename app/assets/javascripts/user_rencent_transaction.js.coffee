$(document).on 'change', 'select#user_recent_transaction_currency', (event) ->
    $('#amount_received_currency').html($('<i class="fa fa-fw fa-'+$(this).val().toLowerCase()+'">'))
