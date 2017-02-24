Project = ($filter) ->
  this.all = [
    { id: 1, title: 'Project 1' },
    { id: 2, title: 'Project 2' }
  ]

  this.show = (id) ->
    @project = $filter('filter')(this.all, { id: id })[0];
  return

angular.module('toDoApp').service 'Project', ['$filter', Project]
