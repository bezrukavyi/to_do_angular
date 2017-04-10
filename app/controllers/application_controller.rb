class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  include ActionController::Serialization
  include DeviseTokenAuth::Concerns::SetUserByToken

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from CanCan::AccessDenied, with: :record_not_found

  def angular
    render 'layouts/application'
  end

  private

  def record_not_found(error)
    render json: { error: error.message }, status: :not_found
  end

  def current_ability
    @current_ability ||= Ability.new(current_api_user)
  end
end
