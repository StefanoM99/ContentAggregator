//= require jquery
//= require jquery_ujs
//= require rails-ujs
//= require filterrific/filterrific-jquery

1
2
3
$( "#lolid" ).click(function() {
    console.log("ciao")
    $(this).prop("disabled", true);
  });
