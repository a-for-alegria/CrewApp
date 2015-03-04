$(document).ready(function(){
  
  // Close alert messages on click 

  alertClose($('.success, .alert, .alert-message li'));

});

function alertClose(selectors) {
	selectors.on('click', function(){
  	$(this).remove();
  })
}