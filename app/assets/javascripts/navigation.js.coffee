$ ->
  nav = $("header .nav")
  top = parseInt($("header").css("marginTop"))
  height = nav.height()
  nav.css top: -height
  
  $(".menu").click ->
    margin = parseInt($("header").css("marginTop"))
    if margin == height
      $("header").animate marginTop: top, 200
    else
      $("header").animate marginTop: height, 200