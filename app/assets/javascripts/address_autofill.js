/*global $*/
$(function() {
  $(document).on('turbolinks:load', () => {
    $('user_postal_code').jpostal({
      postcode : [
        '#user_postal_code'
      ],
      address: {
        "#user_prefecture": "%3",
        "#user_address_city": "%4%5",
      }
    });
  });
});

$(function() {
  $(document).on('turbolinks:load', () => {
    $('salon_postal_code').jpostal({
      postcode : [
        '#salon_postal_code'
      ],
      address: {
        "#salon_prefecture": "%3",
        "#salon_address_city": "%4%5",
      }
    });
  });
});