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
      $("#page_image").val(image)
    });
  }
});
