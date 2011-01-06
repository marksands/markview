$(document).ready(function() {

  $('#save').click(function(e){
    e.preventDefault();
    $.post("/save", { markup: $('#editbox').val() }, function(response) {
      if ( response.error == true ) {
        $(function () {
          $.notifyBar({
            cls: 'error',
            html: response.message,
            delay: 2000,
            animationSpeed: "normal"
          });  
        });
      }
      else {
        $(function () {
          $.notifyBar({
            cls: 'success',
            html: response.message,
            delay: 2000,
            animationSpeed: "normal"
          });
        });
      }
    }, 'json');
  });

  $('#edit').click(function(e){
    //e.preventDefault();
  });

});
