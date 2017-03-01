angular.module('toDoApp').config ['$stateProvider', '$urlRouterProvider', ($stateProvider, $urlRouterProvider) ->
  $stateProvider
  .state 'sign_in',
    url: '/sign_in'
    templateUrl: 'sessions/new.html',
    controller: 'SessionsController',
    controllerAs: 'session',
    resolve: auth: redirectAuthed

  .state 'sign_up',
    url: '/sign_up'
    templateUrl: 'users/new.html',
    controller: 'UsersController',
    controllerAs: 'user',
    resolve: auth: redirectAuthed

  .state 'project',
    url: '/'
    controller: 'ProjectsController'
    controllerAs: 'projects'
    templateUrl: 'projects/show.html',
    resolve: auth: redirectAuth

  .state 'project.list',
    templateUrl: 'projects/list.html'


  $urlRouterProvider.otherwise '/'

  return
]


redirectAuth = ($auth, $state, TodoToast) ->
  $auth.validateUser().catch (res) ->
    TodoToast.error('Must authed')
    $state.go 'sign_in'
    return

redirectAuthed = ($auth, $state, TodoToast) ->
  $auth.validateUser()
    .then(() ->
      TodoToast.error('You have already sined in')
      $state.go 'project'
      return
    )
    .catch(() ->
      return
    )

angular.module('toDoApp').run ($rootScope, $state, $auth) ->
  $rootScope.$on 'auth:logout-success', (ev) ->
    $state.go 'sign_in'

  $rootScope.$on 'auth:login-success', (ev) ->
    $state.go 'project'
  return
