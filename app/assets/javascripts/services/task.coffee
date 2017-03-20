Task = ($resource) ->
  $resource '/api/tasks/:id', { id: '@id' },
    create:
      method: 'POST'
    update:
      method: 'PATCH'
    delete:
      method: 'DELETE'

angular.module('toDoApp').factory 'Task', ['$resource', Task]
