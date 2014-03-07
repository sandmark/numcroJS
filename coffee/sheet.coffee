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
      $(form).createSheet()

    errorClass: "has-error",
    validClass: "has-success",

    errorPlacement: (error, element) ->

    highlight: (element, errorClass) ->
      $(element).parent().addClass errorClass
      $("#size_error").showError()

    unhighlight: (element, errorClass) ->
      $("#size_error").hide("fast")
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
    else
      x = $(this).find("[name=x]").val()
      y = $(this).find("[name=y]").val()

      for row in [0...y] by 1
        tr = $("<tr>")
        for col in [0...x] by 1
          tr.append $("<td><input type='text'></td>")
        tbody.append tr

      sheet.animate {height: "toggle", opacity: "toggle"}, "slow"
    false
