Attachment = ($resource, Upload) ->
  comment: (comment, file) ->
    Upload.upload(url: "/api/comments/#{comment.id}/attachments", file: file)

  call: $resource '/api/attachments/:id', { id: '@id' },
    delete:
      method: 'DELETE'

angular.module('toDoApp').factory 'Attachment', ['$resource', 'Upload', Attachment]
