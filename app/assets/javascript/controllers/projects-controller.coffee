ProjectsController = (Project, $stateParams, $state, $filter, TodoToast) ->
  $state.transitionTo('project.list')

  ctrl = this
  ctrl.currentProject = null
  ctrl.all = null

  ctrl.date = new Date()
  ctrl.minDate = new Date(
    ctrl.date.getFullYear(),
    ctrl.date.getMonth(),
    ctrl.date.getDate()
  )

  ctrl.index = () ->
    Project.index().$promise
      .then((response) ->
        ctrl.all = response
      )
      .catch((response) ->
        TodoToast.error(response.data.error)
      )

  ctrl.show = (options) ->
    Project.get(options).$promise
      .then((response) ->
        if response.completed_at
          response.completed_at = new Date(response.completed_at)
        ctrl.currentProject = response
      )
      .catch((response) ->
        ctrl.currentProject = null
        TodoToast.error(response.data.error)
      )

  ctrl.create = () ->
    Project.create(title: 'New project').$promise
      .then((response) ->
        ctrl.all.push(response)
        ctrl.currentProject = response
        TodoToast.success('Project success created')
      )
      .catch((response) ->
        TodoToast.error(response.data.error)
      )

  ctrl.edit = (form) ->
    project = ctrl.currentProject
    return true if form.$invalid
    ctrl.update(form, project) if form.edited == true
    form.edited = !form.edited

  ctrl.update = (form, project) ->
    return unless form.$valid
    Project.update(project).$promise
      .catch((response) ->
        TodoToast.error(response.data.error)
      )

  ctrl.delete = (project) ->
    Project.delete(id: project.id).$promise
      .then((response) ->
        ctrl.delete_from_list(ctrl.currentProject)
        ctrl.currentProject = null
        TodoToast.success("Project '#{response.title}' success deleted")
      )
      .catch((response) ->
        TodoToast.error(response.data.error)
      )

  ctrl.delete_from_list = (project) ->
    index = ctrl.all.indexOf($filter('filter')(ctrl.all, id: project.id)[0])
    ctrl.all.splice(index, 1) if (index != -1)

  ctrl.index()

  return

angular.module('toDoApp').controller 'ProjectsController', [
  'Project',
  '$stateParams',
  '$state',
  '$filter',
  'TodoToast',
  ProjectsController
]
