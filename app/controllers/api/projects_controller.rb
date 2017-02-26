module Api
  class ProjectsController < ApplicationController
    def index
      @projects = Project.all
      render json: @projects, each_serializer: SimpleProjectSerializer
    end

    def show
      @project = Project.find(params[:id])
      render json: @project
    end

    def update
      @project = Project.find(params[:id])
      if @project.update_attributes(allowed_params)
        render json: @project
      else
        render json: { error: @project.errors.full_messages }
      end
    end

    def create
      @project = Project.new(allowed_params)
      if @project.save
        render json: @project
      else
        render json: { error: @project.errors.full_messages }
      end
    end

    def destroy
      @project = Project.find(params[:id])
      if @project.destroy
        render json: @project
      else
        render json: { error: @project.errors.full_messages }
      end
    end

    private

    def allowed_params
      params.require(:project).permit(:title)
    end
  end
end
