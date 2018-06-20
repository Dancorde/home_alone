jQuery ->
  markersArray = []
  lat_field = $('#place_latitude')
  lng_field = $('#place_longitude')

  window.initMap = ->
    if $('#map').size() > 0

      map = new google.maps.Map document.getElementById('map'), {
        center: { lat: parseFloat $('#latResult').val(), 10,
                  lng: parseFloat $('#lngResult').val(), 10
                }
        zoom: 15
      }

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

    placeMarkerAndPanTo {
      lat: parseFloat $('#latResult').val(), 10
      lng: parseFloat $('#lngResult').val(), 10
    }, map

  placeMarkerAndPanTo = (latLng, map) ->
    markersArray.pop().setMap(null) while(markersArray.length > 1)
    marker = new google.maps.Marker
      position: latLng
      map: map

    map.panTo latLng
    markersArray.push marker
