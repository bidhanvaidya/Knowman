//style/display
$(function(){
  
  //$('#accordion, #input-field-hider').hide();
  
  
  //interface styles
  $('.input').addClass('ui-widget ui-corner-all');
  $('#mainmenu > a').addClass('button');
  $('.button').button();
  $('#mainmenu-button-holder > *, #styled-choice-links > a, #accordion > div > h3 > button').button({
	icons: {primary:'ui-icon-locked'},text:false 
  }).removeClass('ui-corner-all');
  //$('#__sub').addClass('hidden');
  
  //left and right floats
  $('#styled-choice-links, #accordion > div > h3 > a').addClass('left');
  $('#actions, #user-panel > *').addClass('right');
  
});