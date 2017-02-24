Project = ($filter, $resource) ->
  $resource '/api/projects/:id', { id: '@id' },
    index:
      method: 'GET'
      isArray: true

angular.module('toDoApp').factory 'Project', ['$filter', '$resource', Project]
