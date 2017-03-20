angular.module('toDoApp').directive 'commentsCreate', () ->
  restrict: 'E'
  replace: true
  templateUrl: 'comments/form-create.html'
  scope:
    ctrl: '='
    task: '='
