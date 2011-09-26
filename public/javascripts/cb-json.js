$(document).ready(function(){

//style/display
$(function(){

  $('#accordion, #input-field-hider').hide();
  
  
  //interface styles
  $('.input').addClass('ui-widget ui-corner-all');
  $('#mainmenu > a, #mainmenu-button-holder > button').addClass('button');
  $('.button').button();
  
  //left and right floats
  $('#styled-choice-links').addClass('left');
  $('#actions, #tabs-menu-wrapper, #user-panel > *').addClass('right');
  
});

//interface functionality
$(function() {
  
$('#choice-tabs').tabs();
$('#choice-tabs').removeClass('ui-corner-all');

$('a[class*="tabs-"]').click(function(e){
	
	$('.active').removeClass('active');
	
	e.preventDefault();
	var href = $(this).attr('class');
	var link = $('a[href="#'+href+'"]');

	link.click();
							 
	var name = "name"; 
							 
	if ( $('#'+href+'').is(':empty') ) {
	
		$('#input-field').clone().appendTo('#'+href+'');
							 
	}
    $(this).addClass('active');

});
$('#mainmenu-button-holder > button').click(function(e){
						
   var href = $(this).attr('id');
   var link = $('a[href="/'+href+'"]');
   
   link.click();										
   console.log(href);
   
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
	   
	   var rels	= [];
	   var emps	= [];
	   var prod	= [];
	   var monies	= [];
	   var funding	= [];
	   var offices = [];
	   
	   
	   //$('.view').empty();
	   
	   $.each(data, function(key, value) {
			  
			  if ( key == "number_of_employees" ) {
			  
			  emps.push('<li id="' + key + '"><b>' + key + ':</b><span>' + value + '</span></li>');
			  
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
		 
		 'id': 'emps',
		 html: emps.join('')
		 
		 }).appendTo('#top');
	   $('<ul/>', {
		 
		 'id': 'prods',
		 html: prod.join('')
		 
		 }).appendTo('#middle');
	   $('<ul/>', {
		 
		 'id': 'rels',
		 html: rels.join('')
		 
		 }).appendTo('#middle');
	   $('<ul/>', {
		 
		 'id': 'offices',
		 html: offices.join('')
		 
		 }).appendTo('#middle');
	   $('<ul/>', {
		 
		 'id': 'funding',
		 html: funding.join('')
		 
		 }).appendTo('#bottom');
	   
	   //$('#info').attr('val', '' + items + '');
	   //alert(n);
	   
	   });
$('#accordion').show();

});



});
});