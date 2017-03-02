UsersController = ($auth, $state, TodoToast, Omniauth) ->
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
    .then((response) ->
      TodoToast.success('Success registered. Confirmation email sent to you')
      return
    )
    .catch((response) ->
      TodoToast.error(response.data.errors.full_messages[0])
      return
    )

  ctrl.omniauth = (provider) ->
    Omniauth.call(provider)

  return

angular.module('toDoApp').controller 'UsersController', ['$auth', '$state', 'TodoToast', 'Omniauth', UsersController]
