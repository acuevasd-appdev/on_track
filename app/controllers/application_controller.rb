class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, if: :json_request?
  before_action :configure_permitted_parameters, if: :devise_controller?


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:update, keys: [:username])
  end

  respond_to :html, :json

  #protect_from_forgery with: :null_session, if: :json_request?

  def json_request?
    request.format.json?
  end

  

end
