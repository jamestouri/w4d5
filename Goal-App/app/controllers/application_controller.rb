class ApplicationController < ActionController::Base
  
  def current_user
    @current_user ||= User.find_by(id: params[:id]) 
  end
  
  def login!(user)
    @current_user = user
    session[:session_token] = User.reset_session_token!
  end
  
  def logged_in?
    !!current_user
  end 
end
