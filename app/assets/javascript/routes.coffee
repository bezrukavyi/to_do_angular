angular.module('toDoApp').config ['$routeProvider', ($routeProvider) ->
  $routeProvider
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
