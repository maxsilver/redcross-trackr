$ ->
  top = parseInt($(".nav").css("top"))
  height = $(".nav").height()
  $(".nav").css top: top - height
  
  $(".menu").click ->
    margin = parseInt($("header").css("marginTop"))
    if margin == height
      $("header").animate marginTop: 0
    else
      $("header").animate marginTop: height