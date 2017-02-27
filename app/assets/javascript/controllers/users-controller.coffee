UsersController = ($auth, TodoToast, Omniauth) ->
  ctrl = this

  ctrl.new = {
    email: null,
    password: null,
    password_confirmation: null
  }

  ctrl.resetNew = () ->
    ctrl.new = {}

  ctrl.create = (form) ->
    return if form.$invalid
    $auth.submitRegistration(ctrl.new)
    .then((resp) ->
      console.log('success')
      console.log(resp)
      return
    )
    .catch((resp) ->
      console.log(resp)
      return
    )

  ctrl.omniauth = (provider) ->
    Omniauth.call(provider)

  return

angular.module('toDoApp').controller 'UsersController', ['$auth', 'TodoToast', 'Omniauth', UsersController]
