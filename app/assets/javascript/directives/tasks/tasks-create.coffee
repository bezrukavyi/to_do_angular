angular.module('toDoApp').directive 'tasksCreate', () ->
  return {
    restrict: 'E',
    replace: true,
    scope: {
      ctrl: '=',
      project: '='
    },
    templateUrl: 'tasks/form.html'
   }
