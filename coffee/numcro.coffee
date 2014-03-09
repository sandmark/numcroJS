$ ->
  # --------------------------------------------------
  # Function: isVisible
  #   returns which the element is visible or invisibile
  #
  $.fn.isVisible = ->
    $.expr.filters.visible this[0]
