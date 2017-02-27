angular.module('toDoApp').config ['$stateProvider', ($stateProvider) ->
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
    url: '/projects/:projectId'
    templateUrl: 'projects/show.html',
    controller: 'ProjectsController',
    controllerAs: 'projects',
    reloadOnSearch: false,
    resolve: auth: redirectAuth

  .state 'index',
    url: '/',
    templateUrl: 'projects/show.html',
    resolve: auth: redirectAuth

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
      $state.go 'index'
      return
    )
    .catch(() ->
      return
    )


angular.module('toDoApp').run ($rootScope, $state, $auth) ->
  $rootScope.$on 'auth:logout-success', (ev) ->
    $state.go 'sign_in'
  return
