$(function(){

	$(document).ready(function(){
	
		$('#__sub').click();
	
	});
  
  var n = new Number(1);
  var s = $('.accordion > div:first > h3 > a:first').text();
  var t = new Array();
	  t = s.split(' ');
  var c = t[0];
  
  for (i=0;i<n;i++) {
  
  var clone = $('.accordion > div:first').clone();
  
  $(clone).appendTo('.accordion');
  
  }
  console.log(n);
  
  $('h1, h2').css({"margin-top":"25px"});
  
  
});