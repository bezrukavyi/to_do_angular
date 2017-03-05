module Api
  class CommentsController < ApplicationController
    load_and_authorize_resource

    def index
      render json: @comments
    end

    def create
      if @comment.save
        render json: @comment
      else
        render json: { error: @comment.errors.full_messages }
      end
    end

    def update
      if @comment.update_attributes(comment_params)
        render json: @comment
      else
        render json: { error: @comment.errors.full_messages }
      end
    end

    def destroy
      if @comment.destroy
        render json: @comment
      else
        render json: { error: @comment.errors.full_messages }
      end
    end

    private

    def comment_params
      params.require(:comment).permit(:title, :task_id)
    end
  end
end
