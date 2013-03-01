$(document).ready(function() {
  $("#orders").unbind("show");
  $("#orders").unbind("hide");

  /* Ensures that, when clicking on a non-tab link which takes the user to
     another tab's content, the correct tab is highlighted. */
  $("#summary_history").click(function(e) {
    $('a[href=#history]').tab('show');
  });

  $("#details_history").click(function(e) {
    $('a[href=#history]').tab('show');
  });


  $('#events').on('show', function () {
    $("#toggle").text("Hide Events");
  })

  $('#events').on('hide', function () {
    $("#toggle").text("Show Events");
  })

  
  /* Disable address bar hashing for better user experience (so when viewing a
     case, the page won't jump on a refresh) */
  $('a[data-toggle="tab"]').live('click', function(e){
    e.preventDefault();
  });
});




