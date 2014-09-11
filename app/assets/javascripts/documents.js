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
  $("table > tbody > tr").each(function() {
    $(this).hover(function() {
      $("div#doc-details").html("Hi there!").parent().show();
    }, function() {
      $("div#doc-details").parent().hide();
    })
  });
});









// $("table > tbody > tr").first().hover(function() { $("div#doc-details").html("Hi").parent().show() }, function() { $("div#doc-details").html("").parent().hide() })