class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, if: :json_request?

  respond_to :html, :json

  #protect_from_forgery with: :null_session, if: :json_request?

  def json_request?
    request.format.json?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :private])
    devise_parameter_sanitizer.permit(:update, keys: [:private])
  end

end
