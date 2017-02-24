@app = angular.module('toDoApp', ['ngMaterial', 'ngRoute', 'ngMessages', 'templates'])

@app.config ($mdThemingProvider, $mdIconProvider) ->
  $mdThemingProvider
    .theme('default')
    .primaryPalette('blue')
    .accentPalette('blue')
  $mdIconProvider
    .fontSet('md-icons', 'material-icons');
