//style/display
$(function(){
  
  //interface styles
  $('.input').addClass('ui-widget');
  $('#mainmenu > a').addClass('button');
  $('.button').button();
  $('#mainmenu-button-holder > *, #styled-choice-links > a, .accordion > div > h3 > button').button({
	icons: {primary:'ui-icon-locked'},text:false
  }).removeClass('ui-corner-all');
  
  //left and right floats
  $('#styled-choice-links, .accordion > div > h3 > a').addClass('left');
  $('#actions, #user-panel > *').addClass('right');
  
});