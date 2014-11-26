jQuery ->
  $("a[rel~=popover], .has-popover").popover()
  $("a[rel~=tooltip], .has-tooltip").tooltip()
  $(".input-group.date").datepicker({
  	startDate: "01/01/2014", endDate: "31/12/2015"
  })
