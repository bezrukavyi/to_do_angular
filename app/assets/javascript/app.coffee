@app = angular.module('toDoApp', ['ngMaterial', 'ngRoute', 'templates'])

MainController = ($scope, projects) ->
  this.projects = projects.all
  this.current_project = this.projects[0]

  this.setContent = (project) ->
    console.log('sdfsdf')
    this.current_project = project if project
  return

@app.controller 'MainController', ['$scope', 'projects', MainController]

@app.factory 'projects', ->
  all: [
    {
      title: 'Project 1',
      tasks: [
        { title: 'Task 2', checked: false },
        { title: 'Task 3', checked: true },
        { title: 'Task 4', checked: true },
        { title: 'Task 5', checked: true }
      ]
    },
    {
      title: 'Project 2',
      tasks: [
        { title: 'Task 6', checked: false },
        { title: 'Task 7', checked: true },
        { title: 'Task 9', checked: true }
      ]
    }
  ]
