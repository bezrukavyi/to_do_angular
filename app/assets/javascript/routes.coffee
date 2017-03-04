angular.module('toDoApp').config ['$stateProvider', '$urlRouterProvider', ($stateProvider, $urlRouterProvider) ->
  $stateProvider
  .state 'root',
    url: ''
    controller: 'MainController'
    controllerAs: 'main'
    templateUrl: 'layouts/app.html'

  .state 'sign_in',
    url: '/sign_in'
    parent: 'root'
    templateUrl: 'sessions/new.html'
    controller: 'SessionsController'
    controllerAs: 'session'
    resolve: auth: redirectAuthed

  .state 'sign_up',
    url: '/sign_up'
    parent: 'root'
    templateUrl: 'users/new.html'
    controller: 'UsersController'
    controllerAs: 'user',
    resolve: auth: redirectAuthed

  .state 'project',
    url: '/projects'
    parent: 'root'
    controller: 'ProjectsController'
    controllerAs: 'projects'
    templateUrl: 'projects/show.html'
    resolve: auth: redirectAuth

  .state 'project.detail',
    url: '/:projectId'
    parent: 'project'
    templateUrl: 'projects/detail.html'

  $urlRouterProvider.otherwise '/projects'

  return
]

redirectAuth = ($auth, $state, I18n, TodoToast) ->
  $auth.validateUser().catch (res) ->
    TodoToast.error(I18n.t('auth.error.must_authed'))
    $state.go 'sign_in'
    return

redirectAuthed = ($auth, $state, $location, I18n, TodoToast) ->
  $auth.validateUser()
    .then(() ->
      $location.path('/')
      TodoToast.error(I18n.t('auth.error.signed_in'))
      return
    )
    .catch(() ->
      return
    )

angular.module('toDoApp').run ($rootScope, $state, $auth, I18n, TodoToast) ->
  $rootScope.$on 'auth:logout-success', (ev) ->
    $state.go 'sign_in'
    TodoToast.success(I18n.t('auth.success.sign_out'))
  return
