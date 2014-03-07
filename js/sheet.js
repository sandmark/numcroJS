// Generated by CoffeeScript 1.7.1
$(function() {
  $("#size").validate({
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
    submitHandler: function(form) {
      return $(form).createSheet();
    },
    errorClass: "has-error",
    validClass: "has-success",
    errorPlacement: function(error, element) {},
    highlight: function(element, errorClass) {
      $(element).parent().addClass(errorClass);
      return $("#size_error").showError();
    },
    unhighlight: function(element, errorClass) {
      $("#size_error").hide("fast");
      return $(element).parent().removeClass(errorClass).addClass("has-success");
    }
  });
  $.fn.showError = function() {
    if ($(this).isVisible()) {
      return $(this).find("p[name=message]").fadeOut("fast", function() {
        return $(this).fadeIn("fast");
      });
    } else {
      return $(this).show("fast");
    }
  };
  return $.fn.createSheet = function() {
    var col, row, sheet, tbody, tr, x, y, _i, _j;
    sheet = $("#sheet");
    tbody = sheet.find("tbody");
    if (tbody.children().length > 0) {
      $("#sheet_generated").showError();
    } else {
      x = $(this).find("[name=x]").val();
      y = $(this).find("[name=y]").val();
      for (row = _i = 0; _i < y; row = _i += 1) {
        tr = $("<tr>");
        for (col = _j = 0; _j < x; col = _j += 1) {
          tr.append($("<td><input type='text'></td>"));
        }
        tbody.append(tr);
      }
      sheet.animate({
        height: "toggle",
        opacity: "toggle"
      }, "slow");
    }
    return false;
  };
});
