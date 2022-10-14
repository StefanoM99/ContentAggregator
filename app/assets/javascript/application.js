
//= require rails-ujs

1
2
3
$( "#lolid" ).click(function() {
    console.log("ciao")
    $(this).prop("disabled", true);
  });
