Comment = ($resource) ->
  {
    nested: $resource '/api/tasks/:task_id/comments', { task_id: '@task_id' },
      index:
        method: 'GET'
        isArray: true
      create:
        method: 'POST'

    default: $resource '/api/comments/:id', { id: '@id' },
      update:
        method: 'PATCH'
      delete:
        method: 'DELETE'
  }

angular.module('toDoApp').factory 'Comment', ['$resource', Comment]
