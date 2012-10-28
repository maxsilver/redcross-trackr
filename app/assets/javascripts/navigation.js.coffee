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

  showNav = ->
    if $(window).width() > 600
      $("header").css marginTop: height
    else
      $("header").css marginTop: top

  resizeTime = null;
  $(window).resize ->
    clearTimeout(resizeTimer)
    resizeTimer = setTimeout(showNav, 100)

  showNav()