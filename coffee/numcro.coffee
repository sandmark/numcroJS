$ ->
  $.fn.isVisible = ->
    $.expr.filters.visible this[0]

  $.fn.blink = (speed = "fast", count = 1) ->
    if $(this).isVisible()
      if count == 0
        return false
      else
        $(this).fadeOut speed, ->
          $(this).fadeIn speed, ->
            $(this).blink speed, count-1

  $.fn.highlight = ->
    if $(this).isVisible() then $(this).blink() else $(this).show("fast")

  $("#size").submit ->
    x = Number $("#size [name=x]").val()
    y = Number $("#size [name=y]").val()
    msg = $("#size_error")
    if isNaN(x) or isNaN(y) or x <= 0 or y <= 0
      msg.highlight()
    else
      alert $.type(x) + "#{x}"
    false
