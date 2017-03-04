angular.module('toDoApp').directive 'tasksItem', () ->
  return {
    restrict: 'E',
    replace: true,
    scope: {
      ctrl: '=',
      task: '=',
      project: '='
    },
    templateUrl: 'tasks/item.html'
   }
