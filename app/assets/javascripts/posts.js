$(document).on('ready', function () {
  $("#switch-view").click(function(){
    $(this).find("button").toggleClass("active");
    $(".article-wrapper").toggleClass("bloc col-xs-12 col-xs-4");
  });
});