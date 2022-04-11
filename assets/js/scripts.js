// A $( document ).ready() block.
$( document ).ready(function() {
	(function () {
    var elem = $("p.intro:first").contents().filter(function () { return this.nodeType == 3 }).first(),
        text = elem.text().trim(),
				first = text.slice(0, 1);

		if (!elem.length)
			return;

		elem[0].nodeValue = text.slice(first.length);
		elem.before('<span class="dropcap">' + first + '</span>');
	})();

	// DropCap.js
	var dropcaps = document.querySelectorAll(".dropcap");
	window.Dropcap.layout(dropcaps, 2);

	// Responsive-Nav
	var nav = responsiveNav(".nav-collapse");

	// Round Reading Time
    $(".time").text(function (index, value) {
      return Math.round(parseFloat(value));
    });

});


