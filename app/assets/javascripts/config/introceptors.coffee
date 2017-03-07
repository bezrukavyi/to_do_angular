AccessRequestIntroceptor = (Access, $q) ->
  {
    response: (result) ->
      Access.request = true

      return result
  }

angular.module('toDoApp').config ($httpProvider) ->
  $httpProvider.interceptors.push(AccessRequestIntroceptor)
