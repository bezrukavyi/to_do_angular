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
  end
end
