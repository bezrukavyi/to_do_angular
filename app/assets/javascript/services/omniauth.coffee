Omniauth = ($auth, $state, TodoToast) ->
  service = this

  service.call = (provider) ->
    return unless provider
    $auth.authenticate(provider).then (
      (response) ->
        $state.go 'project'
        console.log(response)
        TodoToast.success('Success singed')
      ), (response) ->
        TodoToast.error('Error authed')

  return

angular.module('toDoApp').service 'Omniauth', ['$auth', '$state', 'TodoToast', Omniauth]
