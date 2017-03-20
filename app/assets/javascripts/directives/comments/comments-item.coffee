angular.module('toDoApp').directive 'commentsItem', () ->
  restrict: 'E'
  replace: true
  templateUrl: 'comments/item.html'
  scope:
    ctrl: '='
    comment: '='
    task: '='
