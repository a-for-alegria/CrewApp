$(document).ready(function(){
  
  // Close alert messages on click 

  alertClose($('.success, .alert, .alert-message li'));

  indexBlockParam('enter');
  indexBlockParam('leave');

});

// Standalone functions------------------------------------//

function alertClose(selectors) {
	selectors.on('click', function(){
  	$(this).remove();
  })
}

function indexBlockParam(obj) {
	$('.index-block-crew, .index-block-client').on('mouse'+obj, function() {
		indexBlockToggle(this);
	});
}

function indexBlockToggle(el) {
  $(el).find('.index-block-nav').slideToggle();
}