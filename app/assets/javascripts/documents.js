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

$(function() {
  // if($("div#doc-details").html() == "") {
  //   $("div#details-board").hide();
  // }
  // $("table > tbody > tr").each(function() {
  //   $(this).hover(function() {
  //     $(this).children().last().children()[4]
  //     $("div#doc-details").html("Hi there!").parent().show();
  //   }, function() {
  //     $("div#doc-details").parent().hide();
  //   })
  // });
});

$(function() {
  $("table tbody tr").each(function() {                 // Selecting rows of index
    var tools_cell = $(this).children().last();         // Selecting the last cell (tool cell) of each column
    var fetch_button = $(tools_cell).children("form").children().children();      // Selecting the button which send ajax request to doc-details
    $(fetch_button).hide();   // Hide the button which is too ugly
    $(this).hover(function() {
      $(fetch_button).trigger("click");     // When the row is hovered, the doc details are updated async
    });
  });
});







// $("table > tbody > tr").first().hover(function() { $("div#doc-details").html("Hi").parent().show() }, function() { $("div#doc-details").html("").parent().hide() })