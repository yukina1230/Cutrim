/*global $*/

document.addEventListener("turbolinks:load"
, function () {
  $(function() {
    $('#slider').slick({
        dots: true,
    });
  });
})
