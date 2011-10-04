$(document).ready(function(){

				  
				  



				  
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
			  emps.push('<li><input id="stlevel_staff_number" type="hidden" value="'+ value +'" name="stlevel[staff_number]"></li>');
			  
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
		 
		 }).appendTo('#staff');
	   $('<ul/>', {
		 
		 'id': 'companies-prods',
		 html: prod.join('')
		 
		 }).appendTo('#products');
	   $('<ul/>', {
		 
		 'id': 'companies-rels',
		 html: rels.join('')
		 
		 }).appendTo('#people');
	   $('<ul/>', {
		 
		 'id': 'companies-offices',
		 html: offices.join('')
		 
		 }).appendTo('#location');
	   $('<ul/>', {
		 
		 'id': 'companies-funding',
		 html: funding.join('')
		 
		 }).appendTo('#funding');
	   
	   
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