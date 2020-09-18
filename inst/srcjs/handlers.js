$( document ).ready(function() {

  Shiny.addCustomMessageHandler('show_modal', function(arg) {
    document.getElementById(arg).style.display='block';
    $( "#" + arg ).children().trigger("show");
    $( "#" + arg ).children().trigger("shown");
  });

  Shiny.addCustomMessageHandler('hide_modal', function(arg) {
    document.getElementById(arg).style.display='none';
  });

});
