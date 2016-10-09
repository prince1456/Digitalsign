# sendFile = (file) ->
#   data = new FormData
#   data.append 'upload[image]', file
#   $.ajax
#     data: data
#     type: 'POST'
#     url: '/uploads'
#     cache: false
#     contentType: false
#     processData: false
#     success: (data) ->
#       $(".summernote").summernote "insertImage", data.url
