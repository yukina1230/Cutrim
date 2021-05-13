/*global $*/

document.addEventListener("turbolinks:load"
, function () {
  $(function() {
    $('#slider').slick({
        dots: true,
        accessibility: true,
        autoplay: true,
    });
  });
})
