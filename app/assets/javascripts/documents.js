// // Move the Plus sign righter in Category form
// $(function() {
//   $("span.glyphicon-plus").css("margin-left", "10px");
// });

// // Cloning categories field when plus sign clicked
// $(function() {
//   $(".glyphicon-plus").click(function() {
//     var selected_field = $("input[name='categories']");
//     var selected_plus_sign = $(".glyphicon-plus").last();
//     var cloned_field = selected_field.clone();
//     var cloned_plus_sign = selected_plus_sign.clone();

//     selected_plus_sign.after($("<br/>"));

//     $(".glyphicon-plus ~ br").last().after(cloned_field);
//     $(".glyphicon-plus ~ br ~ input").last().after(cloned_plus_sign);

//     // selected_plus_sign.after($("<br/>")).insertAfter(cloned_field).insertAfter(cloned_plus_sign);
//     // var selected_parent = selected_field.parent();
//     // var selected_plus_sign = $(".glyphicon-plus").first().clone();
//     // selected_plus_sign.after($("<br/>"));
//     // var selected_clone = selected_plus_sign.appendTo(selected_field.clone());
//     // selected_clone.appendTo(selected_field.parent());
//   });
// });

// $(function() {
//   $("table tbody tr").each(function() {
//     $(this).click(function() {
//       $.getJSON()
//     })
//   })
// })

$(function() {
  $("table tbody tr").each(function() {                 // Selecting rows of index
    var tools_cell = $(this).children().last();         // Selecting the last cell (tool cell) of each column
    var fetch_button = $(tools_cell).children("form").children().children();      // Selecting the button which send ajax request to doc-details
    $(fetch_button).hide();   // Hide the button which is too ugly
    $(this).click(function(event) {
      console.log(this);
      event.preventDefault();
      $(fetch_button).click(function(event) {
        $(this).click();
        event.stopPropagation();
      });
      // event.preventDefault();
      // console.log(event);
    });
  });
});

// To fill in the english / chinese school name when losed focus
$(function() {
  $("#document_school_english_school").blur(function() {
    if($(this).val() !== "" && $("#document_school_chinese_school").val() === "") {
      var request_url = "/schools/" + $(this).val() + ".json";
      $.getJSON(request_url, function(data) {
        // console.log(data);
        $("#document_school_chinese_school").val(data["chinese_school"]);
      });
    }
  });
});

$(function() {
  $("#document_school_chinese_school").blur(function() {
    if($(this).val() !== "" && $("#document_school_english_school").val() === "") {
      var request_url = "/schools/" + $(this).val() + ".json";
      // console.log(request_url);
      $.getJSON(request_url, function(data) {
        // console.log(data);
        $("#document_school_english_school").val(data["english_school"]);
      });
    }
  });
});
