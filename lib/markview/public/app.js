$(document).ready(function() {

  $('#save').click(function(e){
    e.preventDefault();
    $.post("/save", { markup: $('#editbox').val() }, function(response) {
      if ( response.error == true ) {
        // do something
      }
      //$('#flash').hide().html(response.message).fadeIn();
    }, 'json');
  });

  $('#edit').click(function(e){
    //e.stop();
  });

});
