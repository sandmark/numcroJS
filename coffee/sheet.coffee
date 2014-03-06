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
      message = $("#size_error")
      $(element).parent().addClass errorClass
      if message.isVisible()
        message.find("p[name=message]").fadeOut "fast", ->
          $(this).fadeIn("fast")
      else
        message.show("fast")

    unhighlight: (element, errorClass) ->
      $("#size_error").hide("fast")
      $(element).parent().removeClass(errorClass).addClass("has-success")
  }
