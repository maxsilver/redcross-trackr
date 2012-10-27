# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# the compiled file.
#
# WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
# GO AFTER THE REQUIRES BELOW.
#
#= require jquery
#= require jquery_ujs
#= require_tree .

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
