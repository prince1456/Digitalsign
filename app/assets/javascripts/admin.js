$(document).ready(function() {
  $("li #make_menu").click(function(event) {
    event.preventDefault();
    console.log("help-block");
    // $("iframe").attr("src", "/pages/new")
    $("div #frame").html("<iframe class='embed-responsive-item' src='/pages/new' width='100%', height='600px'></iframe>").slideDown(5000)
    // $("div #frame").prepend("<%= j render(:partial => 'pages/new_page') %>")
// .append("<%= render :partial => 'pages' %>");
  })
  $("li #show_template").click(function(event) {
    event.preventDefault();
    console.log("help-block");
    // $("iframe").attr("src", "/pages/").fadeIn(1000);
  $("div #frame").html("<iframe class='embed-responsive-item' src='/pages/' width='100%', height='600px'></iframe>")
  })
})
