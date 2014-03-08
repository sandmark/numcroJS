$ ->
  # --------------------------------------------------
  # Validation of size form
  #
  $("#size").validate {
    rules: {
      x: {
        required: true,
        digits: true,
        min: 1
      },
      y: {
        required: true,
        digits: true,
        min: 1
      }
    },

    submitHandler: (form) ->
      $("#size_error").hide("fast")
      $(form).createSheet()

    invalidHandler: (form, validator) ->
      $("#size_error").showError()

    errorClass: "has-error",
    validClass: "has-success",

    errorPlacement: (error, element) ->

    highlight: (element, errorClass) ->
      $(element).parent().addClass errorClass

    unhighlight: (element, errorClass) ->
      $(element).parent().removeClass(errorClass).addClass("has-success")
  }

  # --------------------------------------------------
  # Function: showError
  #   show or blink error message
  #
  $.fn.showError = ->
    if $(this).isVisible()
      $(this).find("p[name=message]").fadeOut "fast", ->
        $(this).fadeIn("fast")
    else
      $(this).show("fast")

  # --------------------------------------------------
  # Function: createSheet
  #   creates a sheet has size X and Y from form
  #
  $.fn.createSheet = ->
    sheet = $("#sheet")
    tbody = sheet.find("tbody")

    if tbody.children().length > 0
      $("#sheet_generated").showError()
      sheet.find("input")[0].focus()
    else
      x = $(this).find("[name=x]").val()
      y = $(this).find("[name=y]").val()

      input = '<input type="text" autocomplete="off" class="text-center">'
      for row in [0...y] by 1
        tr = $("<tr>")
        for col in [0...x] by 1
          td = $("<td class='text-center'>")
          td.append($(input))
          tr.append(td)
        tbody.append(tr)

      sheet.animate {height: "toggle", opacity: "toggle"}, "slow", ->
        $(this).find("input")[0].focus()
      sheet.registerKeys().registerValidation()
    false

  # --------------------------------------------------
  # Function: registerKeys
  #   Register key events
  #
  $.fn.registerKeys = ->
    $(this).find("input").keyup (e) ->
      keyEnter = 13
      if e.keyCode is keyEnter
        $(":input:eq(#{$(':input').index(this)+1})").focus()

  # --------------------------------------------------
  # Function: registerValidation
  #   Register validation for sheet
  #
  $.fn.registerValidation = ->
