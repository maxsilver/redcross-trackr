$ ->
  element = $(".map")
  if element.length > 0
    icon = new google.maps.MarkerImage "/assets/red-cross-pin.png", new google.maps.Size(36, 44)

    map = new google.maps.Map(element[0], {
      mapTypeId: google.maps.MapTypeId.ROADMAP
    })

    bounds = new google.maps.LatLngBounds()

    $(".location").each (i, location) ->
      marker = new google.maps.Marker({
        position: new google.maps.LatLng($(location).data("lat"), $(location).data("lng")),
        map: map, icon: icon
      })
      
      # infowindow = new google.maps.InfoWindow({
      #   content: $(location).find(".name").text()
      # })
      # 
      # google.maps.event.addListener marker, 'click', ->
      #   infowindow.open(map, marker)

      bounds.extend(marker.getPosition())

    map.fitBounds(bounds)
