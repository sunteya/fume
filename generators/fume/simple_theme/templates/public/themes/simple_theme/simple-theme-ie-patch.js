$(function() {
	if ($.browser.msie) {
		$(".block").corner("top 6px");
		$("#main-navigation, #main-navigation .active").corner("top 6px");
		$("#footer .block").corner("round  6px");
		$(".table th.first").corner("tl  6px");
		$(".table th.last").corner("tr  6px");
		
		$(".jquery-corner").css("z-index", "5");
		$("#user-navigation").css("z-index", "10");
		
		if ($.browser.version == "6.0") {
			$("#header, #page").css({
				width: $("#container").css("min-width"),
				margin: "0 auto"
			});
		}
	}
});