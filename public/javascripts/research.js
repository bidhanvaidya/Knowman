$(function(){
	$(function(){
$("#notification_next_notification").datepicker({ dateFormat: 'dd-mm-yy' });
  });
  	$(function() {
		$( "#draggable" ).draggable();
	});
	$.fx.speeds._default = 1000;
	$(function() {
		$( "#dialog" ).dialog({
			autoOpen: false,
			show: "blind",
			hide: "explode"
		});

		$( "#opener" ).click(function() {
			$( "#dialog" ).dialog( "open" );
			return false;
		});
	});
	
	
	$(function() {
		$( "#research_area" ).accordion({
			event: "mouseover"
		});
	});
	
});
