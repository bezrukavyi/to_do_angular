module Api
  class AttachmentsController < ApplicationController
    load_and_authorize_resource :comment
    load_and_authorize_resource through: :comment, only: :create
    load_and_authorize_resource only: :destroy

    def create
      @attachment.file = params[:file]
      if @attachment.save
        render json: @attachment
      else
        render json: { error: @attachment.errors.full_messages }
      end
    end

    def destroy
      if @attachment.destroy
        render json: @attachment
      else
        render json: { error: @attachment.errors.full_messages }
      end
    end
  end
end
