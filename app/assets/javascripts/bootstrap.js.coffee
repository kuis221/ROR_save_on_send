sos = sos or {}
sos.e = (if ('ontouchstart' in document.documentElement) then 'tap' else 'click')

# Render rating
sos.renderRating = ->
  $(".star").rating()
  return

# Render masks
sos.renderMasks = ->
  #$('.mask-date').inputmask "m/d/y"
  #$('.mask-money-sent').inputmask "Regex",
  #  regex: "^[1-9]\,?[0-9]{0,2}|[1-2]\,?[0-9]{3}$"
  #$('.mask-money-received').inputmask "Regex",
  #  regex: "^[1-9][0-9]{0,2}\,?[0-9]{3}$"
  #$('.mask-money-fees').inputmask "Regex",
  #  regex: "^([1-9]([0-9])?[.])?[0-9]{1,2}$"
  #$('.mask-minutes').inputmask "Regex",
  #  regex: "^[1-9]|[1-5][0-9]|60$"
  #$('.mask-hours').inputmask "Regex",
  #  regex: "^[1-9]|1[0-9]|2[0-4]$"
  #$('.mask-days').inputmask "Regex",
  #  regex: "^[1-9]|1[0-4]$"

  $(".mask-date").mask "00/00/0000",
    placeholder: "DD/MM/YYYY"
  $(".mask-money-sent").mask "0,000",
    reverse: true
  $(".mask-money-received").mask "000,000",
    reverse: true
  $(".mask-money-fees").mask "00.00",
    reverse: true
  $('.mask-minutes').mask "00"
  $('.mask-hours').mask "00"
  $('.mask-days').mask "00"

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
  #$("a[rel~=popover], .has-popover").popover()
  #$("a[rel~=tooltip], .has-tooltip").tooltip()

  $(".input-group.date").datetimepicker
    minDate: '1/1/2013'
    maxDate: '12/31/2015'
    showToday: true
    pickTime: false

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
