@app = angular.module('toDoApp', ['ngMaterial', 'ngRoute', 'ngMessages', 'templates'])

MainController = (project, task) ->
  this.projects = project.all
  this.tasks = task.all
  this.currentProject = this.projects[0]
  this.editedTask = null

  # Project

  this.setCurrentProject = (project) ->
    this.currentProject = project if project
    this.resetTaskForm()

  this.checkCurrentPorject = (project) ->
    return false unless project
    this.currentProject == project

  this.createProject = () ->
    project = {
      id: this.projects.lenght,
      title: 'New project'
    }
    this.projects.push(project)

  # TASK

  this.resetTaskForm = () ->
    this.newTask = {
      title: '',
      checked: false,
      project_id: this.currentProject.id
    }

  this.createTask = (task) ->
    task.id = this.tasks.length
    this.tasks.push(task)
    this.resetTaskForm()

  this.updateTask = (task) ->
    console.log('updated success')

  this.deleteTask = (task) ->
    index = this.tasks.indexOf(task);
    this.tasks.splice(index, 1) if (index != -1)

  this.editTask = (task) ->
    return true if task.$invalid
    this.updateTask(task) if task.edited == true && task.$valid
    task.edited = !task.edited

  this.resetTaskForm()
  return

@app.controller 'MainController', ['project', 'task', MainController]

@app.factory 'project', ->
  all: [
    { id: 1, title: 'Project 1' },
    { id: 2, title: 'Project 2' }
  ]
@app.factory 'task', ->
  all: [
    { id: 1, project_id: 1, title: 'Task 1', checked: true },
    { id: 2, project_id: 2, title: 'Task 2', checked: false },
    { id: 3, project_id: 1, title: 'Task 3', checked: true },
    { id: 4, project_id: 1, title: 'Task 4', checked: false }
    { id: 5, project_id: 2, title: 'Task 5', checked: true }
    { id: 6, project_id: 1, title: 'Task 6', checked: true }
  ]

@app.config ($mdThemingProvider, $mdIconProvider) ->
  $mdThemingProvider
    .theme('default')
    .primaryPalette('blue')
    .accentPalette('blue')
  $mdIconProvider
    .fontSet('md-icons', 'material-icons');
