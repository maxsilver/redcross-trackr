$ ->
  $(".location .info").popover content: $(".location .details").html()
  $(".location .info").click ->
    $(".popover").css  left: 5, right: 5
    $(".popover .arrow").css  left: 'auto', right: 32