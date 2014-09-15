
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
        categories_content = "";
        for(var i=0; i<data['categories'].length; i++) {
          categories_content += "<li class='list-group-item'>";
          categories_content += data['categories'][i]['category'];
          categories_content += "</li>";
        }
        $("#footer_categories_list").html(categories_content);
      });
    });
  });
});

$(function() {
  $("tbody tr td a.embeding-pdf").click(function(event) {
    event.stopPropagation();
    $("table").after("<div id='pdf' class='row'>")
    // $(this).parent().parent().after("<div id='pdf'>");
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


$(function() {
  $("table tr td:nth-child(4)").each(function() {
  // console.log(this);
  $(this).hide();
  });
});



