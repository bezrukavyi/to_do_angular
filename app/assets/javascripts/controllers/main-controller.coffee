MainController = ($mdSidenav) ->
  ctrl = this

  ctrl.toggleLeftSidenav = () ->
    $mdSidenav('left-sidenav').toggle()

  ctrl.closeLeftSidenav = () ->
    $mdSidenav('left-sidenav').close()

  return

angular.module('toDoApp').controller 'MainController', [
  '$mdSidenav',
  MainController
]
