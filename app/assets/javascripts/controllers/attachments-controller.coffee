AttachmentController = (TodoToast, I18n, Attachment, Access) ->
  ctrl = this

  ctrl.upload = (files, object, type) ->
    return unless files && files.length
    for file, index in files
      if type == 'comment'
        ctrl.upload_comment(object, file)
      else
        TodoToast.error(I18n.t('attachment.error.unsupported'))

  ctrl.delete = (attachment, object) ->
    return unless Access.can('request')
    Access.lock('request')
    Attachment.call.delete(id: attachment.id).$promise.then (
      (response) ->
        index = object.attachments.indexOf(attachment)
        object.attachments.splice(index, 1) if (index != -1)
        TodoToast.success(I18n.t('attachment.success.deleted', name: response.file.filename))
      ), (response) ->
        TodoToast.error('attachment.error.deleted')


  ctrl.upload_comment = (object, file) ->
    Attachment.comment(object, file).then (
      (response) ->
        data = response.data
        object.attachments.push(data)
        TodoToast.success(I18n.t('attachment.success.created', name: data.file.filename))
      ), (response) ->
        TodoToast.error(I18n.t('attachment.error.created'))

  return


angular.module('toDoApp').controller 'AttachmentController', [
  'TodoToast',
  'I18n',
  'Attachment',
  'Access',
  AttachmentController
]
