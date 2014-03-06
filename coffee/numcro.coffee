$ ->
  # --------------------------------------------------
  # Function: isVisible
  #   returns which element is visible or invisibile
  #
  $.fn.isVisible = ->
    $.expr.filters.visible this[0]

  # --------------------------------------------------
  # Function: createSheet
  #   creates a sheet has size X and Y
  #
  $.fn.createSheet = ->
    x = $(this).find("[name=x]").val()
    y = $(this).find("[name=y]").val()
    console.log "X = #{x}, Y = #{y}"
    false
