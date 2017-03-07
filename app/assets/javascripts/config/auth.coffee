angular.module('toDoApp').config ($authProvider) ->
  $authProvider.configure {
    omniauthWindowType: 'newWindow'
    authProviderPaths: {
      github:   '/auth/github',
      facebook: '/auth/facebook',
      google:   '/auth/google_oauth2'
    }
  }
