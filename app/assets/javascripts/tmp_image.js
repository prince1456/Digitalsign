$(document).ready(function(){
  if($('.tmp-image').length > 0){
    $('.tmp-image').on('click', function(event){
      event_target = event.target
      id = event_target.id
      body = event_target.dataset.body
      image = event_target.src
      $("section").remove();
      // $(".sidekick-body").prepend(body);
      $(".note-editable.panel-body").html(body);
      $("#page_image").val(image);

    });
  }

});

function openNav() {
    document.getElementById("mySidenav").style.width = "427px";
    document.getElementById("main").style.marginLeft = "427px";
    document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
  }
function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    document.getElementById("main").style.marginLeft= "0";
    document.body.style.backgroundColor = "black";
  }
