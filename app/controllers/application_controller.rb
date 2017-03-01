class ApplicationController < ActionController::Base
  include ActionController::Serialization
  include DeviseTokenAuth::Concerns::SetUserByToken

  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  rescue_from CanCan::AccessDenied do |_exception|
    render json: { status: :forbidden }
  end

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
