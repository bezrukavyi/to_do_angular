TasksController = (Task) ->

  this.all = Task.all

  this.editedTask = null

  this.resetTaskForm = () ->
    this.newTask = {
      title: '',
      checked: false
    }

  this.createTask = (task, project) ->
    task.id = this.all.length
    task.project_id = project.id
    this.all.push(task)
    this.resetTaskForm()

  this.deleteTask = (task) ->
    index = this.all.indexOf(task);
    this.all.splice(index, 1) if (index != -1)

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


  this.resetTaskForm()
  return


angular.module('toDoApp').controller 'TasksController', ['Task', TasksController]
