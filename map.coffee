jQuery ->
  markersArray = []
  lat_field = $('#place_latitude')
  lng_field = $('#place_longitude')

  window.initMap = ->
    if $('#map').size() > 0
      map = new google.maps.Map document.getElementById('map'), {
        center: {lat: -22.0124251, lng: -47.897135}
        zoom: 15
      }

      map.addListener 'click', (e) ->
        placeMarkerAndPanTo e.latLng, map
        updateFields e.latLng

      $('#find-on-map').click (e) ->
        e.preventDefault()
        placeMarkerAndPanTo {
          lat: parseFloat lat_field.val(), 10
          lng: parseFloat lng_field.val(), 10
        }, map

    placeMarkerAndPanTo {
      lat: -22.0124251
      lng: -47.897135
    }, map

  placeMarkerAndPanTo = (latLng, map) ->
    markersArray.pop().setMap(null) while(markersArray.length)
    marker = new google.maps.Marker
      position: latLng
      map: map

    map.panTo latLng
    markersArray.push marker

  updateFields = (latLng) ->
    lat_field.val latLng.lat()
    lng_field.val latLng.lng()

  iconBase = Rails.root.join('app', 'assets', 'images')
  icons = {
    universidade: {
      icon: iconBase + 'pinUniversidade.png'
    },
    banco: {
      icon: iconBase + 'pinBanco.png'
    },
    usp: {
      icon: iconBase + 'pinUniversidadeUsp.png'
    },
    bar: {
      icon: iconBase + 'pinBar.png'
    },
    hospital: {
      icon: iconBase + 'pinHospital.png'
    },
    onibus: {
      icon: iconBase + 'pinOnibus.png'
    },
    restaurante: {
      icon: iconBase + 'pinRestaurante.png'
    },
    supermercado: {
      icon: iconBase + 'pinSupermercado.png'
    },
    ufscar: {
      icon: iconBase + 'pinUniversidadeUfscar.png'
    }
  };

