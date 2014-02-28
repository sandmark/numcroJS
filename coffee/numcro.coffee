$ ->
  $.fn.isVisible = ->
    $.expr.filters.visible this[0]

  blink = (elm, speed = "fast", count = 2) ->
    if elm.isVisible()
      if count == 0
        return
      else
        elm.fadeOut speed, -> $(this).fadeIn speed
        blink(elm, speed, count-1)

  showSizeError = (elm) ->
    if elm.isVisible() then blink(elm) else elm.show("fast")

  $("#size").submit ->
    x = Number $("#size [name=x]").val()
    y = Number $("#size [name=y]").val()
    msg = $("#size_error")
    if isNaN(x) or isNaN(y) or x <= 0 or y <= 0
      showSizeError(msg)
#    showSizeError unless x or y
#    showSizeError if x <= 0 or y <= 0
    else
      alert $.type(x) + "#{x}"
    false
