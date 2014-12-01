ready = ->
  $("a[rel~=popover], .has-popover").popover()
  $("a[rel~=tooltip], .has-tooltip").tooltip()

  #Masks start
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
  #End

# Fix turbolinks
$(document).ready(ready)
$(document).on('page:load', ready)
