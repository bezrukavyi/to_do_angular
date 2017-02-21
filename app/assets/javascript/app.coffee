@app = angular.module('toDoApp', ['ngMaterial', 'ngRoute', 'ngMessages', 'templates'])

MainController = (project, task) ->
  this.projects = project.all
  this.tasks = task.all
  this.currentProject = null
  this.editedTask = null


  # PROJECT

  this.deleteProject = () ->
    index = this.projects.indexOf(this.currentProject);
    this.currentProject = null
    this.projects.splice(index, 1) if (index != -1)

  this.setCurrentProject = (project) ->
    this.currentProject = project if project
    this.resetTaskForm()

  this.checkCurrentPorject = (project) ->
    return false unless project
    this.currentProject == project

  this.createProject = () ->
    project = {
      id: this.projects.length + 1,
      title: 'New project'
    }
    this.projects.push(project)
    this.setCurrentProject(project)

  this.editProject = (projectForm) ->
    project = this.currentProject
    return true if projectForm.$invalid
    this.updateTask(projectForm, project) if projectForm.edited == true
    projectForm.edited = !projectForm.edited

  this.updateProject = (projectForm) ->
    project = this.currentProject
    return console.log('updated failure') unless projectForm.$valid
    console.log(project.title)
    console.log(project.id)
    console.log('updated success')


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

  this.deleteTask = (task) ->
    index = this.tasks.indexOf(task);
    this.tasks.splice(index, 1) if (index != -1)

  this.editTask = (taskForm, task) ->
    return true if taskForm.$invalid
    this.updateTask(taskForm, task) if taskForm.edited == true
    taskForm.edited = !taskForm.edited

  this.updateTask = (taskForm, task) ->
    return console.log('updated failure') unless taskForm.$valid
    console.log(task.title)
    console.log(task.checked)
    console.log(task.id)
    console.log('updated success')

  return


#CONTROLLER

@app.controller 'MainController', ['project', 'task', MainController]



#FACTORIES

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


#CONFIG

@app.config ($mdThemingProvider, $mdIconProvider) ->
  $mdThemingProvider
    .theme('default')
    .primaryPalette('blue')
    .accentPalette('blue')
  $mdIconProvider
    .fontSet('md-icons', 'material-icons');
