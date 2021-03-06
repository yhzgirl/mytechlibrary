class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  def authenticate
    if current_user == nil
      flash[:notice] = "Please login to access this area."
      redirect_to root_path
    end
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
