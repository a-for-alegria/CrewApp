$(document).ready(function(){
  
  // Close alert messages on click 

  $('.alert').on('click', function(){
  	$(this).remove();
  })

  $('.success').on('click', function(){
  	$(this).remove();
  })

  $('.alert-message li').on('click', function(){
  	$(this).remove();
  })
});