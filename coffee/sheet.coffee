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
  # Validation of answerForm
  #
  $("#answerForm").validate {
    rules: {
      length: {
        required: true,
        digits: true,
        min: 1
      }
    },

    submitHandler: (form) ->
      $("#answer_error").hide("fast")
      $(form).createAnswer()

    invalidHandler: (form, validator) ->
      $("#answer_error").showError()

    errorClass: "has-error",
    validClass: "has-success",

    errorPlacement: (error, element) ->

    highlight: (element, errorClass) ->
      $(element).parent().addClass errorClass

    unhighlight: (element, errorClass) ->
      $(element).parent().removeClass(errorClass).addClass("has-success")
  }

  # --------------------------------------------------
  # Function: createAnswer
  #   creates answer table depending length of answerForm
  #
  $.fn.createAnswer = ->
    answer = $("#answer")
    if answer.find("input").length > 0
      $("#answerAlreadyExistsError").showError()
      false
    else
      tr = answer.find("tr")
      for i in [0..$(this).length]
        input = $("<input type='text' autocomplete='off' class='text-center'>")
        td    = $("<td class='text-center'>")
        td.append(input)
        tr.prepend(td)
      answer.animate {height: "toggle", opacity: "toggle"}, "slow", ->
        answer.find("input")[0].focus()
      false

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
        if not $("#answer").isVisible()
          $("#answerInvisibleError").showError()
          $("#answerForm").find("input")[0].focus()
        else
          $(this).find("input")[0].focus()
          sheet.registerKeys()
    false

  # --------------------------------------------------
  # Function: registerKeys
  #   Register key events from Enter to Tab
  #
  $.fn.registerKeys = ->
    $(this).find("input").keypress (e) ->
      keyEnter = 13
      code = e.keyCode or e.which
      if code is keyEnter
        $(":input:eq(#{$(':input').index(this)+1})").focus()
    $(this)

  # --------------------------------------------------
  # Submit override of Base sheet
  #
  $("#sheet").submit ->
    $(this).find("button").hide("slow")
    $(this).find("input").each ->
      e = $(this)
      n = Number(e.val())
      width = e.parent().width()
      height= e.parent().height()
      e.parent().width(width)
      e.parent().height(height)
      if isNaN(n) or n is 0
        e.parent().addClass("cell-block").end().remove()
      else
        input = "<input placeholder='#{n}' type='text' autocomplete='off' class='text-center'>"
        e.replaceWith(input)
    $(this).registerKeys().registerSync()
    false

  # --------------------------------------------------
  # Function: registerSync
  #   Synchronize characters in same numbers
  #
  $.fn.registerSync = ->
