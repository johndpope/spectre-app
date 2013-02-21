$(document).ready(function() {
  if (location.hash !== '') $('a[href="' + location.hash + '"]').tab('show');
  return $('a[data-toggle="tab"]').click(function(e) {
    return location.hash = $(e.target).attr('href').substr(1);
  });
});

$(document).ready(function() {
  $("#case_manager_tabs").click(function(e) {
    $('a[href=#history]').tab('show');
  });
});
