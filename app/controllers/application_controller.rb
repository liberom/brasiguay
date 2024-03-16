class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def dashboard
  end

  def set_current_user
    @current_user = current_user if user_signed_in?
  end

end
