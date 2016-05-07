class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  helper_method :xeditable?

  def xeditable? object = nil
    true # Or something like current_user.xeditable?
  end

  def after_sign_in_path_for(resource)
    feeds_path
  end
  
  def after_sign_out_path_for(resource)
    root_path
  end

  protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name,:last_name,:email,:password,:password_confirmation,:courses,:academia, :avatar, :avatar_cache) }
        devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name,:last_name,:password, :avatar, :avatar_cache) }
    end
end
   

