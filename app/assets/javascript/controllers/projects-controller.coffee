ProjectsController = (Project, $location, $routeParams) ->

  this.all = Project.all
  this.currentProject = Project.show($routeParams.projectId)

  this.deleteProject = () ->
    index = this.all.indexOf(this.currentProject);
    this.currentProject = null
    this.all.splice(index, 1) if (index != -1)

  this.checkCurrentPorject = (project) ->
    return false unless project
    this.currentProject == project

  this.createProject = () ->
    project = {
      id: this.all.length + 1,
      title: 'New project'
    }
    this.all.push(project)
    $location.path("/projects/#{project.id}")

  this.editProject = (projectForm) ->
    project = this.currentProject
    return true if projectForm.$invalid
    this.updateProject(projectForm, project) if projectForm.edited == true
    projectForm.edited = !projectForm.edited

  this.updateProject = (projectForm) ->
    project = this.currentProject
    return console.log('updated failure') unless projectForm.$valid
    console.log(project.title)
    console.log(project.id)
    console.log('updated success')

  return

angular.module('toDoApp').controller 'ProjectsController', ['Project', '$location', '$routeParams', ProjectsController]
