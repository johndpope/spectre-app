$(document).ready(function() {
  $("#orders").unbind("show");
  $("#orders").unbind("hide");

  $("#summary_history").click(function(e) {
    $('a[href=#history]').tab('show');
  });

  $("#details_history").click(function(e) {
    $('a[href=#history]').tab('show');
  });

  $('#orders').on('show', function () {
    $("#toggle").text("Hide Orders");
  })

  $('#orders').on('hide', function () {
    $("#toggle").text("Show Orders");
  })
  
  /*
  if (location.hash != '') $('a[href="' + location.hash + '"]').tab('show');
  return $('a[data-toggle="tab"]').click(function(e) {
    return location.hash = $(e.target).attr('href').substr(1);
  });*/

  $('a[data-toggle="tab"]').live('click', function(e){
    e.preventDefault();
  });
});




