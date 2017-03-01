module Api
  class TasksController < ApplicationController
    load_and_authorize_resource

    def create
      if @task.save
        render json: @task
      else
        render json: { error: @task.errors.full_messages }
      end
    end

    def update
      if @task.update_attributes(task_params)
        render json: @task
      else
        render json: { error: @task.errors.full_messages }
      end
    end

    def destroy
      if @task.destroy
        render json: @task
      else
        render json: { error: @task.errors.full_messages }
      end
    end

    private

    def task_params
      params.require(:task).permit(:title, :checked, :project_id)
    end
  end
end
