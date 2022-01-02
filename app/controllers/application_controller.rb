class ApplicationController < ActionController::Base
  include Pundit
  include Pagy::Backend
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def after_sign_in_path_for(*)
    if current_user.admin?
      rails_admin_path
    else
      stored_location_for(resource) || root_path
    end
  end

  def user_not_authorized
    flash[:warning] = 'You are not authorized to perform this action.'
    redirect_to request.headers['Referer'] || root_path
  end

  protected

  def configure_permitted_parameters
    added_attrs = %i[username email role password password_confirmation remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: %i[login password]
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
