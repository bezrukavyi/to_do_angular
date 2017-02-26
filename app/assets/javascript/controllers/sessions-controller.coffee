SessionsController = ($auth, $rootScope, TodoToast) ->
  ctrl = this
  ctrl.newSession = {}

  ctrl.signIn = (form) ->
    return if form.$invalid
    options = {
      email: form.email.$viewValue,
      password: form.password.$viewValue
    }
    $auth.submitLogin(options).then (
      (response) ->
        TodoToast.success('Success singed in')
      ), (response) ->
        TodoToast.error(response.errors[0])

  return

angular.module('toDoApp').controller 'SessionsController', ['$auth', '$rootScope', 'TodoToast', SessionsController]
