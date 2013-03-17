$(document).ready(function() {
  
  $("tr span.expand").click(function() {
    $(this).parents("tr.main").nextUntil("tr.main").toggle();
  });
});





