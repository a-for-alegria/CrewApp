$(document).ready(function(){
  
  // Close alert messages on click 

  alertClose($('.success, .alert, .alert-message li'));

  $('.index-container-crew').on('mouseenter', '.index-block-crew', function() {
  	$(this).find('.index-block-nav').slideToggle();
  })
  $('.index-container-crew').on('mouseleave', '.index-block-crew', function() {
  	$(this).find('.index-block-nav').slideToggle();
  })
});

function alertClose(selectors) {
	selectors.on('click', function(){
  	$(this).remove();
  })
}