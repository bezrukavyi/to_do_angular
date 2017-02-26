module Api
  class TasksController < ApplicationController
    def update
      @task = Task.find(params[:id])
      if @task.update_attributes(allowed_params)
        render json: @task
      else
        render json: { error: @task.errors.full_messages }
      end
    end

    def create
      @task = Task.new(allowed_params)
      if @task.save
        render json: @task
      else
        render json: { error: @task.errors.full_messages }
      end
    end

    def destroy
      @task = Task.find(params[:id])
      if @task.destroy
        render json: @task
      else
        render json: { error: @task.errors.full_messages }
      end
    end

    private

    def allowed_params
      params.require(:task).permit(:title, :checked, :project_id)
    end
  end
end
