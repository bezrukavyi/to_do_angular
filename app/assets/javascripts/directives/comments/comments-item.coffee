angular.module('toDoApp').directive 'commentsItem', () ->
  return {
    restrict: 'E',
    replace: true,
    scope: {
      ctrl: '=',
      comment: '=',
      task: '='
    },
    templateUrl: 'comments/item.html'
   }
