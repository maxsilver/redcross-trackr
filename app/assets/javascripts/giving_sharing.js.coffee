$ ()->
  return if $(".container-select").length == 0

  $("#giving-lending-location").change( (e)->
    location_id = $(e.target).val()
    $(".container-select").attr("disabled","disabled").hide()
    $("#container-" + location_id).removeAttr("disabled").show()
  )

  $(".container-select").attr("disabled","disabled").hide()
  $(".container-select:first").removeAttr("disabled").show()


