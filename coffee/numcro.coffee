$ ->
  # --------------------------------------------------
  # Function: isVisible
  #   returns which element is visible or invisibile
  #
  $.fn.isVisible = ->
    $.expr.filters.visible this[0]
