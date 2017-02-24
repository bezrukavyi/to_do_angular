angular.module('toDoApp').directive 'tasksItem', () ->
  return {
    restrict: 'E',
    replace: true,
    scope: {
      ctrl: '=',
      item: '=',
    },
    templateUrl: 'tasks/item.html'
   }
