$(document).ready(function(){
	
$(function(){var init = [];$.each($('.staff-levels').children(), function(){init.push($(this).attr('class'));});m = 0;var n = init.length +1;for ( i=1; i<n; i++ ) {$('.staff-levels').children(':nth-child('+i+')').clone().appendTo('div[id="staff-'+init[m]+'"]');m++}});
$(function(){var officeList = [];$.each($('#hidden-interface-elements > .offices').children(), function(){officeList.push( $(this).attr('class') );});m = 0;var n = officeList.length + 1;for ( i=1; i<n; i++  ) {$('#hidden-interface-elements > .offices').children(':nth-child('+ i +')').clone().appendTo('div[id="offices-'+officeList[m]+'"]');m++}});
$(function(){var productList = [];$.each($('#hidden-interface-elements > .products').children(), function(){productList.push( $(this).attr('class') );});m = 0;var n = productList.length + 1;for ( i=1; i<n; i++  ) {$('#hidden-interface-elements > .products').children(':nth-child('+ i +')').clone().appendTo('div[id="products-'+productList[m]+'"]');m++}});
$(function(){var fundingRoundsList = [];$.each($('#hidden-interface-elements > .funding_rounds').children(), function(){fundingRoundsList.push( $(this).attr('class') );});m = 0;var n = fundingRoundsList.length + 1;for ( i=1; i<n; i++  ) {$('#hidden-interface-elements > .funding_rounds').children(':nth-child('+ i +')').clone().appendTo('div[id="funding-rounds-'+fundingRoundsList[m]+'"]');m++}});

});
