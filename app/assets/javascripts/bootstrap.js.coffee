sos = sos or {}
sos.e = $.support.touch ? "tap" : "click";

# Render rating
sos.renderRating = ->
  $(".star").rating()
  $(".user-rating").addClass "show"
  return

# Render masks
sos.renderMasks = ->
  $('.mask-date').inputmask "m/d/y"
  $('.mask-money-sent').inputmask "Regex",
    regex: "^[1-9][0-9]{0,2}|[12][0-9]{3}$"
  $('.mask-money-received').inputmask "9999",
    'showMaskOnHover': false,
    'showMaskOnFocus': false
  $('.mask-money-fees').inputmask "Regex",
    regex: "[0-9]{1,2}[.]?[0-9]{0,2}"
  $('.mask-minutes').inputmask "Regex",
    regex: "^[1-9]|[1-5][0-9]|60$"
  $('.mask-hours').inputmask "Regex",
    regex: "^[1-9]|1[0-9]|2[0-4]$"
  $('.mask-days').inputmask "Regex",
    regex: "^[1-9]|1[0-4]$"

# Navigation Toggle
$(document).on "click", ".header .toggle-menu, .opened-menu .wrapper-content, .opened-menu .footer, .menu .close", (e) ->
  e.preventDefault()
  console.log(111)
  $("body").toggleClass "opened-menu"
  return

sos.init = ->
  $("a[rel~=popover], .has-popover").popover()
  $("a[rel~=tooltip], .has-tooltip").tooltip()

  sos.renderMasks()
  sos.renderRating()

ready = ->
  sos.init()

# Fix turbolinks
$(document).ready(ready)
$(document).on('page:load', ready)
