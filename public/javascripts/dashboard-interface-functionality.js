$(function(){

//interface functionality
$(function() {
  
  $('#choice-tabs, #company-1').tabs();
  $('#choice-tabs').removeClass('ui-corner-all');
  
  $('#toolbar > div > a > span').click(function(e){
									   
									   $('.active').removeClass('active'); // for usability
									   
									   e.preventDefault(); //prevent anchor behaviour
									   var h = $(this).parent('a[class^="tabs-"]').attr('class'); //parse list of anchor classes
									   var i = new Array(); //create empty array
									   i = h.split(' '); // populate array with list
									   var j = $('a[href="#'+ i[0] +'"]'); // find anchor with href which matches anchor user clicked on
									   
									   j.click(); // click corresponding anchor
									   
									   var name = "name"; //
									   
									   if ( $('#'+ i[0] +'').is(':empty') ) {
									   
									   $('#input-field').clone().appendTo('#'+ i[0] +'');
									   
									   }
									   $(this).addClass('active');
									   
									   });
  $('#mainmenu-button-holder > button').click(function(){
											  
											  var h = $(this).attr('id');
											  var i = $('a[href="/'+ h +'"]');
											  i.click();
											  
											  });
  
  $('#accordion > div > h3 > button').click(function(){
											
											var h = $(this).attr('rel');
											var i = $('a[href="#'+ h +'"]');
											i.click();
											
											});
  
  var stop = false;
  
  $('#accordion h3').click(function(e) {
						   
						   if ( stop ) {
						   e.stopImmediatePropagation();
						   e.preventDefault();
						   stop = false;
						   }
						   
						   });
  
  $('#accordion').accordion({
							header: "> div > h3"
							}).sortable({
										axis: "y",
										handle: "h3",
										stop: function() {
										stop = true;
										}
										});
  });
$('li > span').live('click', function(){
					
					var val	= $(this).text();
					
					if (val == "null") {
					
					$('#actions').show();
					
					}
					
					}).live('click', function(){
							
							//$('#actions').hide();
							
							});
$('#company-1 > div').append('<div class="chart-holder right" />');

});