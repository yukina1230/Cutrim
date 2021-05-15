/*global $*/
$(function() {
  $(document).on('turbolinks:load', () => {
    $('#postal_code').jpostal({
      postcode : [
        '#postal_code'
      ],
      address: {
        "#prefecture": "%3",
        "#address_city"           : "%4%5",
      }
    });
  });
});
