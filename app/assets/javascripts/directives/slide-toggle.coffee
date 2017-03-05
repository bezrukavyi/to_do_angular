angular.module('toDoApp').directive 'slideToggle', ->
  {
    restrict: 'A'
    scope: isOpen: '=slideToggle'
    link: (scope, element, attr) ->
      slideDuration = parseInt(attr.slideToggleDuration, 10) or 200
      scope.$watch 'isOpen', () ->
        $(element).stop().slideToggle slideDuration
        return
      return

  }
