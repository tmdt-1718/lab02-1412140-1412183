class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  private
  def after_sign_in_path_for(resource)
    user_path(current_user) #your path
  end
  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
end
