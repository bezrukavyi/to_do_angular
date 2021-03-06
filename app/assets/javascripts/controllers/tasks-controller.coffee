TasksController = (Task, TodoToast, I18n, Access) ->
  ctrl = @
  ctrl.editedTask = null

  ctrl.new = { project_id: null, title: null, checked: false }

  ctrl.create = (form, project) ->
    return if form.$invalid || !Access.can('request')
    ctrl.new.project_id = project.id
    Access.lock('request')
    Task.create(ctrl.new).$promise.then (
      (response) ->
        project.tasks.push(response)
        ctrl.resetNew(form)
        TodoToast.success(I18n.t('task.success.created', title: response.title))
      ), (response) ->
        TodoToast.error(response.data.error)

  ctrl.edit = (form, task) ->
    return if form.$invalid
    ctrl.update(form, task) if form.edited == true
    form.edited = !form.edited

  ctrl.update = (form, task) ->
    return if form.$invalid
    Task.update(task).$promise.then(null, (response) ->
      TodoToast.error(response.data.error)
    )

  ctrl.delete = (task, project) ->
    return unless Access.can('request')
    Access.lock('request')
    Task.delete(id: task.id).$promise.then (
      (response) ->
        index = project.tasks.indexOf(task)
        project.tasks.splice(index, 1) if (index != -1)
        TodoToast.success(I18n.t('task.success.deleted', title: response.title))
      ), (response) ->
        TodoToast.error(response.data.error)

  ctrl.resetNew = (form) ->
    form.$setPristine()
    form.$setUntouched()
    ctrl.new = {}

  ctrl.sortableOptions =
    cursor: 'move',
    stop:  (event, ui) ->
      task = ui.item.scope().task
      task.position = ui.item.index() + 1
      Task.update(task).$promise.then(null, (response) ->
        TodoToast.error(response.data.error)
      )

  return


angular.module('toDoApp').controller 'TasksController', [
  'Task',
  'TodoToast',
  'I18n',
  'Access',
  TasksController
]
