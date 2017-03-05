angular.module('toDoApp').directive 'commentsCreate', () ->
  return {
    restrict: 'E',
    replace: true,
    scope: {
      ctrl: '=',
      task: '='
    },
    templateUrl: 'comments/form-create.html'
   }
