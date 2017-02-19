angular.module('toDoApp').config ['$routeProvider', ($routeProvider) ->
  $routeProvider
    .when('/',
      templateUrl: 'index.html',
      controller: 'MainController',
      controllerAs: 'main'
    )
    .otherwise(redirectTo: '/')
]
