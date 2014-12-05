$(document).on 'click', '[name="user_recent_transaction[currency]"]', (event) ->
    $('#amount_received_currency').html($('<i class="fa fa-fw fa-'+$(this).val().toLowerCase()+'">'))

