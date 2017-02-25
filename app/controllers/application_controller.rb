class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include ActionController::Serialization

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def angular
    render 'layouts/application'
  end

  private

  def record_not_found(error)
    render json: { error: error.message }, status: :not_found
  end
end
