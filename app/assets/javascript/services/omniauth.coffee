Omniauth = ($auth) ->
  service = this

  service.call = (provider) ->
    return unless provider
    $auth.authenticate(provider).then (
      (response) ->
        console.log('success omniauth')
      ), (response) ->
        console.log('failure omniauth')

  return

angular.module('toDoApp').service 'Omniauth', ['$auth', Omniauth]
