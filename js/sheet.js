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
      $("#size_error").hide("fast");
      return $(form).createSheet();
    },
    invalidHandler: function(form, validator) {
      return $("#size_error").showError();
    },
    errorClass: "has-error",
    validClass: "has-success",
    errorPlacement: function(error, element) {},
    highlight: function(element, errorClass) {
      return $(element).parent().addClass(errorClass);
    },
    unhighlight: function(element, errorClass) {
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
  $.fn.createSheet = function() {
    var col, input, row, sheet, tbody, td, tr, x, y, _i, _j;
    sheet = $("#sheet");
    tbody = sheet.find("tbody");
    if (tbody.children().length > 0) {
      $("#sheet_generated").showError();
      sheet.find("input")[0].focus();
    } else {
      x = $(this).find("[name=x]").val();
      y = $(this).find("[name=y]").val();
      input = '<input type="text" autocomplete="off" class="text-center">';
      for (row = _i = 0; _i < y; row = _i += 1) {
        tr = $("<tr>");
        for (col = _j = 0; _j < x; col = _j += 1) {
          td = $("<td class='text-center'>");
          td.append($(input));
          tr.append(td);
        }
        tbody.append(tr);
      }
      sheet.animate({
        height: "toggle",
        opacity: "toggle"
      }, "slow", function() {
        return $(this).find("input")[0].focus();
      });
      sheet.registerKeys();
    }
    return false;
  };
  $.fn.registerKeys = function() {
    return $(this).find("input").keypress(function(e) {
      var code, keyEnter;
      keyEnter = 13;
      code = e.keyCode || e.which;
      if (code === keyEnter) {
        $(":input:eq(" + ($(':input').index(this) + 1) + ")").focus();
        return false;
      }
    });
  };
  return $("#sheet").submit(function() {
    var e, height, n, ruby, width, _i, _len, _ref;
    _ref = $(this).find("input");
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      e = _ref[_i];
      e = $(e);
      n = Number(e.val());
      width = e.parent().width();
      height = e.parent().height();
      e.parent().width(width);
      e.parent().height(height);
      if (isNaN(n) || n === 0) {
        e.parent().addClass("cell-block").end().remove();
      } else {
        ruby = $("<ruby>　<rt>" + n + "</rt></ruby>");
        e.replaceWith(ruby);
      }
    }
    return false;
  });
});
