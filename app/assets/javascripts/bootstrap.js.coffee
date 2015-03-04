sos = sos or {}
sos.e = (if ('ontouchstart' in document.documentElement) then 'tap' else 'click')

# Render rating
sos.renderRating = ->
  $(".star").rating()
  return

# Render masks
sos.renderMasks = ->
  $(".mask-date").mask "00/00/0000",
    placeholder: "MM/DD/YYYY"
  $(".mask-money-sent").mask "0,000",
    reverse: true
  $(".mask-money-received").mask "000,000",
    reverse: true
  $(".mask-money-fees").mask "00.00",
    reverse: true
  $('.mask-minutes').mask "00"
  $('.mask-hours').mask "00"
  $('.mask-days').mask "00"
  $('.mask-zipcode').mask "00000"

# Navigation Toggle
$(document).on sos.e, ".header .toggle-menu, .opened-menu .wrapper-content, .opened-menu .footer, .menu .close", (e) ->
  e.preventDefault()
  $("body").toggleClass "opened-menu"
  return

$(document).on sos.e, '[data-toggle-amount]', (event) ->
  $('[data-target-amount]').each ->
    $(this).addClass('hide')
  $('[data-target-amount="'+$(this).data('toggle-amount')+'"]').removeClass('hide')

sos.init = ->

  sos.renderMasks()
  sos.renderRating()

  $('[data-toggle-amount]').each ->
    if ($(this).is(':checked'))
      $('[data-target-amount]').each ->
        $(this).addClass('hide')
      $('[data-target-amount="'+$(this).data('toggle-amount')+'"]').removeClass('hide')

ready = ->
  sos.init()

# Fix turbolinks
$(document).ready(ready)
$(document).on('page:load', ready)
