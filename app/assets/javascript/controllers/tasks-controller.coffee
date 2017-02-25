TasksController = (Task, TodoToast) ->
  ctrl = this
  ctrl.editedTask = null

  ctrl.create = (form, project) ->
    return if form.$invalid
    options = { project_id: project.id, title: form.title.$viewValue }
    Task.create(options).$promise.then (
      (response) ->
        project.tasks.push(response)
        TodoToast.success("Task '#{response.title}' success created")
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
    return true if form.$invalid
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
        TodoToast.success("Task '#{response.title}' success updated")
      ), (response) ->
        TodoToast.error(response.data.error)

  return


angular.module('toDoApp').controller 'TasksController', [
  'Task',
  'TodoToast',
  TasksController
]
