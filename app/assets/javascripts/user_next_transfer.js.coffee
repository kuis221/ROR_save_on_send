$(document).on 'change', 'select#user_next_transfer_receive_currency', (event) ->
    $('#amount_receive_currency').html($('<i class="fa fa-fw fa-'+$(this).val().toLowerCase()+'">'))

$(document).on 'click', 'tr.success', (event) ->
  $('#user_next_transfer_originating_source_of_funds_id')
    .val($('.send_method_id', $(this)).text()).change()
  $('#user_next_transfer_destination_preference_for_funds_id')
    .val($('.receive_method_id', $(this)).text()).change()
  $('form.user_next_transfer').submit()
