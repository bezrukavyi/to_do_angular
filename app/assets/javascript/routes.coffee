angular.module('toDoApp').config ['$routeProvider', ($routeProvider) ->
  $routeProvider
    .when('/sign_in',
      templateUrl: 'sessions/new.html',
      controller: 'SessionsController',
      controllerAs: 'session'
    )
    .when('/sign_up',
      templateUrl: 'users/new.html',
      controller: 'UsersController',
      controllerAs: 'user'
    )
    .when('/projects/:projectId',
      templateUrl: 'projects/show.html',
      controller: 'ProjectsController',
      controllerAs: 'projects',
      reloadOnSearch: false
    )
    .when('/',
      templateUrl: 'projects/show.html'
    )
    .otherwise(redirectTo: '/')
]
