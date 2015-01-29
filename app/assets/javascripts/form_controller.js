$(document).ready(function() {

	// Date picker
	var d = new Date(),
		minDate = (d.getMonth() + 1) + "/" + (d.getDate() + 1) + "/" + (d.getFullYear() - 1),
		maxDate = (d.getMonth() + 1) + "/" + d.getDate() + "/" + d.getFullYear();

	$('.input-group.date').datetimepicker({
	    minDate: minDate,
	    maxDate: maxDate,
	    showToday: true,
	    pickTime: false
	});
});