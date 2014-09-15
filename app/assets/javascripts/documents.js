
// Prevent showing the footer when opening file by the icon
$(function() {
  $(".document-open-icon-links").each(function() {
    $(this).click(function(event) {
      event.stopPropagation();
    });
  });
});

$(function() {
  $("table tbody tr").each(function() {
    $(this).click(function() {
      $("#footer").show();
      var document_id = $(this).children().first().html();
      var request_url = "/documents/" + document_id;
      $.getJSON(request_url, function(data) {
        // console.log(data);
        // var html_content = "<div class='row'><div class='col-md-3'>";
        // html_content += "<div class='panel panel-primary'><div class='panel-heading'>";
        // html_content += "<div class='panel-title'>";
        // html_content += "Categories";
        // html_content += "</div>";       // Closing tag for panel-title
        // html_content += "</div>";       // Closing tag for panel-heading
        // html_content += "<div class='panel-body'>";
        // html_content += "<ul class='list-group'>";
        // console.log(data['categories']);
        // console.log(data['categories'][0]);
        categories_content = "";
        for(var i=0; i<data['categories'].length; i++) {
          categories_content += "<li class='list-group-item'>";
          categories_content += data['categories'][i]['category'];
          categories_content += "</li>";
        }
        // // console.log(data['categories'][0][]);
        // for(var i=0; i<data['categories'].length; i++) {
        //   html_content += "<li class='list-group-item'>";
        //   html_content += data['categories'][i]['category'];
        //   html_content += "</li>";
        // }
        // html_content += "</ul>";
        // html_content += "</div>";     // Closing tag for panel-body
        // html_content += "</div>";     // Closing tag for panel

        // html_content += "<div class='col-md-3'>";
        // html_content += "<div class='panel panel-success'><div class='panel-heading'>";
        // html_content += "<div class='panel-title'>";
        // html_content += "Details";
        // html_content += "</div>";   // Closing tag for panel-title
        // html_content += "</div>";   // Closing tag for panel-heading
        // html_content
        $("#footer_categories_list").html(categories_content);

        // $("#doc-details").html(html_content);
      });
    });
  });
});

// Hide the footer when the page refreshed
$(function() {
    $("#footer").hide();
});

// Dismissing footer when the down button inside the footer clicked
$(function() {
  $("#footer-dismiss").parent().click(function() {
    $("#footer").hide();
  });
});

// To fill in the english / chinese school name when losed focus
$(function() {
  $("#document_school_english_school").blur(function() {
    if($(this).val() !== "" && $("#document_school_chinese_school").val() === "") {
      var request_url = "/schools/" + $(this).val() + ".json";
      $.getJSON(request_url, function(data) {
        $("#document_school_chinese_school").val(data["chinese_school"]);
      });
    }
  });
});

$(function() {
  $("#document_school_chinese_school").blur(function() {
    if($(this).val() !== "" && $("#document_school_english_school").val() === "") {
      var request_url = "/schools/" + $(this).val() + ".json";
      $.getJSON(request_url, function(data) {
        $("#document_school_english_school").val(data["english_school"]);
      });
    }
  });
});
