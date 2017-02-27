@app = angular.module('toDoApp', [
  'ngMaterial',
  'ui.router',
  'ngResource',
  'ngMessages',
  'templates',
  'ipCookie',
  'ng-token-auth',
  'ngCookies'
])

@app.config ($mdThemingProvider, $mdIconProvider) ->
  $mdThemingProvider
    .theme('default')
    .primaryPalette('blue')
    .accentPalette('blue')
  $mdIconProvider
    .fontSet('md-icons', 'material-icons');



@app.config ($authProvider) ->
  $authProvider.configure {
    authProviderPaths: {
      github:   '/auth/github',
      facebook: '/auth/facebook',
      google:   '/auth/google_oauth2'
    }
  }
