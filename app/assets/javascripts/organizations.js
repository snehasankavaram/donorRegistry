// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.



var ready;

function initialize() {

  var lat = parseFloat($('#lat').val().split(',')[0].split('>')[1])
  var lon = parseFloat($('#lon').val().split(',')[0].split('>')[1])

  var map = new google.maps.Map(document.getElementById('map'), {
        center: {lat: lat, lng: lon},
        zoom: 8
        });
      var marker = new google.maps.Marker({
        position:  {lat: lat, lng: lon},
        map: map
      });

 }

ready = function() {


};

$(document).ready(ready);
$(document).on('page:load', ready);

