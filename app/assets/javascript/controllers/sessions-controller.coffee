SessionsController = ($auth, $rootScope, $state, TodoToast) ->
  ctrl = this
  ctrl.new = { }

  ctrl.resetNew = () ->
    ctrl.new = { }

  ctrl.signIn = (form) ->
    return if form.$invalid
    $auth.submitLogin(ctrl.new).then (
      (response) ->
        TodoToast.success('Success singed in')
        $state.go 'index'
        ctrl.resetNew()
      ), (response) ->
        TodoToast.error(response.errors[0])

  return

angular.module('toDoApp').controller 'SessionsController', ['$auth', '$rootScope', '$state', 'TodoToast', SessionsController]