SessionsController = ($auth, $rootScope, $state, TodoToast, Omniauth) ->
  ctrl = this
  ctrl.new = {}

  ctrl.signIn = (form) ->
    return if form.$invalid
    $auth.submitLogin(ctrl.new).then (
      (response) ->
        $state.go 'project'
        TodoToast.success('Success singed in')
        ctrl.resetNew(form)
      ), (response) ->
        TodoToast.error(response.errors[0])

  ctrl.omniauth = (provider) ->
    Omniauth.call(provider)

  ctrl.resetNew = (form) ->
    form.$setPristine()
    form.$setUntouched()
    ctrl.new = {}

  return

angular.module('toDoApp').controller 'SessionsController', ['$auth', '$rootScope', '$state', 'TodoToast', 'Omniauth', SessionsController]
