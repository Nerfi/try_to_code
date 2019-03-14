
const addressInput = document.getElementById('gym_address')
if ( addressInput) {
  const places = require('places.js');
  const palcesAutocomplete = places ({
    container: addressInput
  });
}
