jQuery ->
  markersArray = []
  lat_field = $('#place_latitude')
  lng_field = $('#place_longitude')

  window.initMap = ->
    if $('#map').size() > 0
      directionsService = new (google.maps.DirectionsService)
      directionsDisplay = new google.maps.DirectionsRenderer({
        # suppressMarkers: true
      })
      map = new google.maps.Map document.getElementById('map'), {
        center: { lat: parseFloat $('#latResult').val(), 10,
                  lng: parseFloat $('#lngResult').val(), 10
                }
        zoom: 15
      }
      directionsDisplay.setMap map

      $('#busca tbody').on 'click', 'tr', ->
        if $(this).hasClass('selected')
          $(this).removeClass 'selected'
        else
          table_busca.$('tr.selected').removeClass 'selected'
          $(this).addClass 'selected'
        placeMarkerAndPanTo {
          lat: parseFloat table_busca.row(this).data()[2], 10
          lng: parseFloat table_busca.row(this).data()[3], 10
        }, map

        calculateAndDisplayRoute directionsService, directionsDisplay, {lat: parseFloat $('#latResult').val(), 10
        lng: parseFloat $('#lngResult').val(), 10}, {lat: parseFloat table_busca.row(this).data()[2], 10
        lng: parseFloat table_busca.row(this).data()[3], 10}


      $('#proximos tbody').on 'click', 'tr', ->
        if $(this).hasClass('selected')
          $(this).removeClass 'selected'
        else
          table_proximos.$('tr.selected').removeClass 'selected'
          $(this).addClass 'selected'
        placeMarkerAndPanTo {
          lat: parseFloat table_proximos.row(this).data()[2], 10
          lng: parseFloat table_proximos.row(this).data()[3], 10
        }, map

        calculateAndDisplayRoute directionsService, directionsDisplay, {lat: parseFloat $('#latResult').val(), 10
        lng: parseFloat $('#lngResult').val(), 10}, {lat: parseFloat table_proximos.row(this).data()[2], 10
        lng: parseFloat table_proximos.row(this).data()[3], 10}

    placeMarkerAndPanTo {
      lat: parseFloat $('#latResult').val(), 10
      lng: parseFloat $('#lngResult').val(), 10
    }, map

  placeMarkerAndPanTo = (latLng, map) ->
    markersArray.pop().setMap(null) while(markersArray.length > 1)
    if markersArray.length == 0
      image = "http://maps.google.com/mapfiles/ms/icons/blue-dot.png"
    else
      image = "http://maps.google.com/mapfiles/ms/icons/red-dot.png"

    marker = new google.maps.Marker
      position: latLng
      map: map
      icon: image

    map.panTo latLng
    markersArray.push marker

  calculateAndDisplayRoute = (directionsService, directionsDisplay, origin_latLng, destination_latLng) ->
    directionsService.route {
      origin: origin_latLng
      destination: destination_latLng
      travelMode: 'WALKING'
    }, (response, status) ->
      if status == 'OK'
        markersArray.pop().setMap(null) while(markersArray.length > 0)
        directionsDisplay.setDirections response
      else
        window.alert 'Directions request failed due to ' + status
      return
    return
