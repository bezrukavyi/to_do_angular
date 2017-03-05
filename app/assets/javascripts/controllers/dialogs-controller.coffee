DialogsController = ($mdDialog, object, object_ctrl) ->
  ctrl = this
  ctrl.object = object
  ctrl.object_ctrl = object_ctrl
  ctrl.mdDialog = $mdDialog

  ctrl.close = () ->
    ctrl.mdDialog.hide()

  return

angular.module('toDoApp').controller 'DialogsController', [
  '$mdDialog',
  'object',
  'object_ctrl',
  DialogsController
]
