class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def user_is_admin?
    unless user_signed_in? and current_user.admin
      flash[:notice] = "You don't have permission to access this resource."
      redirect_to root_path
    end
  end
end
