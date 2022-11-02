class ApplicationController < ActionController::Base
  def self.default_url_options
    { host: ENV['HOST'] || 'localhost:3000' }
  end

  def after_sign_in_path_for(_resource)
    users_path
  end

  def after_inactive_sign_up_path_for(_resource)
    users_path
  end

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :bio, :email, :password, :password_confirmation, :email_confirmation)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :bio, :email, :password, :current_password)
    end
  end
end
