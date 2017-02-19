var app = angular.module('toDoList', ['ui.router']);

app.controller('MainController', ['projects', MainController]);

function MainController(projects) {
  this.projects = projects.all;
};

app.factory('projects', [function() {
  var object = {
    all: [
      {title: 'post 1'},
      {title: 'post 2'},
      {title: 'post 3'},
      {title: 'post 4'},
      {title: 'post 5'}
    ]
  };
  return object;
}]);
