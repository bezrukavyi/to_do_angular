Task = () ->
  this.all = [
    { id: 1, project_id: 1, title: 'Task 1', checked: true },
    { id: 2, project_id: 2, title: 'Task 2', checked: false },
    { id: 3, project_id: 1, title: 'Task 3', checked: true },
    { id: 4, project_id: 1, title: 'Task 4', checked: false }
    { id: 5, project_id: 2, title: 'Task 5', checked: true }
    { id: 6, project_id: 1, title: 'Task 6', checked: true }
  ]

  this.show = (id) ->
    this.all[id - 1]
  return

angular.module('toDoApp').service 'Task', Task
