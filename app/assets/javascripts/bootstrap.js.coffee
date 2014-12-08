sos = sos or {}
sos.e = (if ('ontouchstart' in document.documentElement) then 'tap' else 'click')

# Render rating
sos.renderRating = ->
  $(".star").rating()
  $(".user-rating").addClass "show"
  return

# Render masks
sos.renderMasks = ->
  $('.mask-date').inputmask "m/d/y",
    yearrange:
      minyear: 2013
      maxyear: 2015
  $('.mask-money-sent').inputmask "Regex",
    regex: "^[1-9]\,?[0-9]{0,2}|[1-2]\,?[0-9]{3}$"
  $('.mask-money-received').inputmask "Regex",
    regex: "^[1-9][0-9]{0,2}\,?[0-9]{3}$"
  $('.mask-money-fees').inputmask "Regex",
    regex: "^([1-9]([0-9])?[.])?[0-9]{1,2}$"
  $('.mask-minutes').inputmask "Regex",
    regex: "^[1-9]|[1-5][0-9]|60$"
  $('.mask-hours').inputmask "Regex",
    regex: "^[1-9]|1[0-9]|2[0-4]$"
  $('.mask-days').inputmask "Regex",
    regex: "^[1-9]|1[0-4]$"

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
  $("a[rel~=popover], .has-popover").popover()
  $("a[rel~=tooltip], .has-tooltip").tooltip()

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
