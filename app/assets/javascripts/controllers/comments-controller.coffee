CommentsController = (Comment, TodoToast, I18n) ->
  ctrl = this
  ctrl.all = null

  ctrl.new = { task_id: null, title: null }

  ctrl.index = (task) ->
    return if ctrl.all
    Comment.nested.index(task_id: task.id).$promise.then (
      (response) ->
        ctrl.all = response
      ), (response) ->
        TodoToast.error(response.data.error)

  ctrl.create = (form, task) ->
    return if form.$invalid
    ctrl.new.task_id = task.id
    Comment.nested.create(ctrl.new).$promise.then (
      (response) ->
        ctrl.all.push(response)
        ctrl.resetNew(form)
        TodoToast.success(I18n.t('comment.success.created', title: response.title))
      ), (response) ->
        TodoToast.error(response.data.error)

  ctrl.delete = (comment) ->
    Comment.default.delete(id: comment.id).$promise.then (
      (response) ->
        index = ctrl.all.indexOf(comment)
        ctrl.all.splice(index, 1) if (index != -1)
        TodoToast.success(I18n.t('comment.success.deleted', title: response.title))
      ), (response) ->
        TodoToast.error(response.data.error)

  ctrl.edit = (form, comment) ->
    return if form.$invalid
    ctrl.update(form, comment) if form.edited == true
    form.edited = !form.edited

  ctrl.update = (form, comment) ->
    return if form.$invalid
    options = { id: comment.id, title: form.title.$viewValue }
    Comment.default.update(options).$promise.then(null, (response) ->
      TodoToast.error(response.data.error)
    )

  ctrl.resetNew = (form) ->
    form.$setPristine()
    form.$setUntouched()
    ctrl.new = {}

  return


angular.module('toDoApp').controller 'CommentsController', [
  'Comment',
  'TodoToast',
  'I18n',
  CommentsController
]
