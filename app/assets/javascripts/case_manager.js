$(document).ready(function() {
  $("#orders").unbind("show");
  $("#orders").unbind("hide");

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
  
  /*
  if (location.hash != '') $('a[href="' + location.hash + '"]').tab('show');
  return $('a[data-toggle="tab"]').click(function(e) {
    return location.hash = $(e.target).attr('href').substr(1);
  });*/

  $('a[data-toggle="tab"]').live('click', function(e){
    e.preventDefault();
  });
});




