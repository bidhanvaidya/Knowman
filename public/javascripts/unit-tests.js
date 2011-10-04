$(function(){
  
  var n = new Number(20);
  
  var clone = $('#accordion > div:first').clone();
  
  for (i=0;i<n;i++) {
  
  $(clone).appendTo('#accordion');
  
  }
  
});