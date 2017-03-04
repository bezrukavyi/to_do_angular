@app = angular.module('toDoApp', [
  'ngMaterial',
  'ui.router',
  'ngResource',
  'ngMessages',
  'templates',
  'ng-token-auth',
  'ngCookies',
  'pascalprecht.translate',
  'tmh.dynamicLocale'
])

@app.config ($mdThemingProvider, $mdIconProvider) ->
  $mdThemingProvider
    .theme('default')
    .primaryPalette('blue')
    .accentPalette('blue')
  $mdIconProvider
    .fontSet('md-icons', 'material-icons')

@app.config ($authProvider) ->
  $authProvider.configure {
    omniauthWindowType: 'newWindow'
    authProviderPaths: {
      github:   '/auth/github',
      facebook: '/auth/facebook',
      google:   '/auth/google_oauth2'
    }
  }


@app.config ($translateProvider) ->
  $translateProvider.useStaticFilesLoader {
    prefix: 'api/translations/',
    suffix: '.json'
  }
  $translateProvider.useSanitizeValueStrategy('escapeParameters')
  $translateProvider.preferredLanguage('en')
  $translateProvider.useLocalStorage()
  $translateProvider.forceAsyncReload(true)

@app.run ($rootScope, $translate, $filter) ->
  $rootScope.changeLocale = (langKey) ->
    $translate.use(langKey)
