ProjectsController = (Project, $routeParams, $location, TodoToast) ->
  ctrl = this
  ctrl.currentProject = null
  ctrl.all = null

  ctrl.index = () ->
    Project.index().$promise.then (
      (response) ->
        ctrl.all = response
      ), (response) ->
        TodoToast.error(response.data.error)

  ctrl.show = (options) ->
    Project.get(options).$promise.then (
      (response) ->
        ctrl.currentProject = response
      ), (response) ->
        TodoToast.error(response.data.error)

  ctrl.delete = (project) ->
    Project.delete(id: project.id).$promise.then (
      (response) ->
        index = ctrl.all.indexOf(project);
        ctrl.currentProject = null if project.id == ctrl.currentProject.id
        ctrl.all.splice(index, 1) if (index != -1)
        TodoToast.success("Project success deleted")
      ), (response) ->
        TodoToast.error(response.data.error)

  ctrl.create = () ->
    Project.create(title: 'New project').$promise.then (
      (response) ->
        ctrl.all.push(response)
        $location.path("/projects/#{response.id}")
        TodoToast.success('Project success created')
      ), (response) ->
        TodoToast.error(response.data.error)

  ctrl.edit = (form) ->
    project = ctrl.currentProject
    return true if form.$invalid
    ctrl.update(form, project) if form.edited == true
    form.edited = !form.edited

  ctrl.update = (form, project) ->
    return unless form.$valid
    options = {
      id: project.id
      title: project.title
    }
    Project.update(options).$promise.then (
      (response) ->
        TodoToast.success('Project success updated')
      ), (response) ->
        TodoToast.error(response.data.error)

  ctrl.index()
  ctrl.show(id: $routeParams.projectId) if $routeParams.projectId

  return

angular.module('toDoApp').controller 'ProjectsController', [
  'Project',
  '$routeParams',
  '$location',
  'TodoToast',
  ProjectsController
]
