jQuery.fn.capitalize = function() {
	$(this[0]).keyup(function(event) {
		var box = event.target,
			txt = $(this).val(),
			start = box.selectionStart,
			end = box.selectionEnd;

		$(this).val(txt.replace(/^(.)|(\s|\-)(.)/, function($1) {
			return $1.toUpperCase();
		}));
		box.setSelectionRange(start, end);
	});

	return this;
}