ToastsController = ($mdToast, message) ->
  ctrl = this
  ctrl.message = message
  ctrl.mdToast = $mdToast

  this.close = () ->
    ctrl.mdToast.hide()

  return

angular.module('toDoApp').controller 'ToastsController', [
  '$mdToast',
  'message',
  ToastsController
]
