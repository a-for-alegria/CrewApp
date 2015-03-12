$(document).ready(function(){
  
  // Close alert messages on click 

  alertClose($('.success, .alert, .alert-message li'));

  // Toggle index blocks navbar
    // Crew
  indexClientCrewBlocksToggle('crew');
    // Clients
  indexClientCrewBlocksToggle('client');

});

// Standalone functions------------------------------------//

function alertClose(selectors) {
	selectors.on('click', function(){
  	$(this).remove();
  })
}

function indexClientCrewBlocksToggle(obj) {
	$('.index-container-crew').on('mouseenter', ".index-block-"+obj, 
  	  indexBlockToggle).on('mouseleave', ".index-block-"+obj, indexBlockToggle)
}

function indexBlockToggle() {
  $(this).find('.index-block-nav').slideToggle();
}