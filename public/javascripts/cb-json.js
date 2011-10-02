$(document).ready(function(){

$(function(){

  var n = new Number(20);
  
  var clone = $('#accordion > div:first').clone();
  
  for (i=0;i<n;i++) {
  
	$(clone).appendTo('#accordion');
  
  }
  
});				  
				  
//style/display
$(function(){

  //$('#accordion, #input-field-hider').hide();
  
  
  //interface styles
  $('.input').addClass('ui-widget ui-corner-all');
  $('#mainmenu > a').addClass('button');
  $('.button').button();
  $('#mainmenu-button-holder > *, #styled-choice-links > a, button').button({
	icons: {primary:'ui-icon-locked'},text:false 
  }).removeClass('ui-corner-all');
  //$('#__sub').addClass('hidden');
  
  //left and right floats
  $('#styled-choice-links').addClass('left');
  $('#actions, #user-panel > *').addClass('right');
  
});

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
$('#mainmenu-button-holder > button').click(function(e){
						
   var h = $(this).attr('id');
   var l = $('a[href="/'+h+'"]');
   
   l.click();										
   console.log(h);
   
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
				  
/* ======= json functionality ======= */
$(function(){


$('#__sub').live('click', function() {

var s = $('#search').val().toLowerCase();
var t = new Array();
    t = s.split(' ');
var j = t.join('-');
var u = "http://api.crunchbase.com/v/1/company/";

$.getJSON('' + u + '' + j + '.js?callback=?', function(data) {
	   
	   var rels		= [];
	   var emps		= [];
	   var prod		= [];
	   var monies	= [];
	   var funding	= [];
	   var offices	= [];
	   
	   
	   //$('.view').empty();
	   
	   $.each(data, function(key, value) {
			  
			  if ( key == "number_of_employees" ) {
			  
			  emps.push('<li id="' + key + '"><b>' + key + ':</b><span>' + value + '</span></li>');
			  emps.push('<input id="stlevel_staff_number" type="hidden" value="'+ value +'" name="stlevel[staff_number]">');
			  
			  }
			  
			  });
	   $.each(data.funding_rounds, function(i, obj) {
			  
			  $.each(obj, function(key, value) {
					 
					 funding.push('<li id="' + key + '"><b>' + key + ':</b><span>' + value + '</span></li>');
					 
					 });
			  
			  });
	   $.each(data.offices, function(i, obj) {
			  
			  $.each(obj, function(key, value) {
					 
					 offices.push('<li id="' + key + '"><b>' + key + ':</b><span>' + value + '</span></li>');
					 
					 });
			  
			  });
	   $.each(data.relationships, function(i, obj) {
			  
			  $.each(obj, function(key, value) {
					 
					 rels.push('<li id="' + key + '"><b>' + key + ':</b><span>' + value + '</span></li>');
					 
					 });
			  
			  });
	   $.each(data.products, function(i, obj) {
			  
			  $.each(obj, function(key, value) {
					 
					 prod.push('<li id="' + key + '"><b>' + key + ':</b><span>' + value + '</span></li>');
					 
					 });
			  
			  });
	   $('<ul/>', {
		 
		 'id': 'companies-emps',
		 html: emps.join('')
		 
		 }).appendTo('#top');
	   $('<ul/>', {
		 
		 'id': 'companies-prods',
		 html: prod.join('')
		 
		 }).appendTo('#middle');
	   $('<ul/>', {
		 
		 'id': 'companies-rels',
		 html: rels.join('')
		 
		 }).appendTo('#middle');
	   $('<ul/>', {
		 
		 'id': 'companies-offices',
		 html: offices.join('')
		 
		 }).appendTo('#middle');
	   $('<ul/>', {
		 
		 'id': 'companies-funding',
		 html: funding.join('')
		 
		 }).appendTo('#bottom');
	   
	   
		  //$('ul').prepend('<div class="companies-sub-menu" />');
		  
		  //$('#info').attr('val', '' + items + '');
		  //alert(n);
	   
	   });
$('#accordion').show();
$(this).replaceWith('<input type="submit" value="submit" name="commit">');
$('body').wrap('<form method="post" action="/companies/5/stlevels" />')

});



});
});