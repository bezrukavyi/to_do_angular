TasksController = (Task, TodoToast) ->
  ctrl = this
  ctrl.editedTask = null

  ctrl.new = { project_id: null, title: null, checked: false }

  ctrl.create = (form, project) ->
    return if form.$invalid
    ctrl.new.project_id = project.id
    Task.create(ctrl.new).$promise.then (
      (response) ->
        project.tasks.push(response)
        TodoToast.success("Task '#{response.title}' success created")
        ctrl.resetNew(form)
      ), (response) ->
        TodoToast.error(response.data.error)

  ctrl.delete = (task, project) ->
    Task.delete(id: task.id).$promise.then (
      (response) ->
        index = project.tasks.indexOf(task)
        project.tasks.splice(index, 1) if (index != -1)
        TodoToast.success("Task '#{response.title}' success deleted")
      ), (response) ->
        TodoToast.error(response.data.error)

  ctrl.edit = (form, task) ->
    return if form.$invalid
    ctrl.update(form, task) if form.edited == true
    form.edited = !form.edited

  ctrl.update = (form, task) ->
    return if form.$invalid
    options = {
      id: task.id,
      title: form.title.$viewValue,
      checked: form.checked.$viewValue
    }
    Task.update(options).$promise.then (
      (response) ->
        TodoToast.success("Task success updated")
      ), (response) ->
        TodoToast.error(response.data.error)

  ctrl.resetNew = (form) ->
    form.$setPristine()
    form.$setUntouched()
    ctrl.new = {}

  return


angular.module('toDoApp').controller 'TasksController', [
  'Task',
  'TodoToast',
  TasksController
]
