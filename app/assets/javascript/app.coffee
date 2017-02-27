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
