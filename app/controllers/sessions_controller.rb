class SessionsController < ApplicationController
  def create
    auth = env["omniauth.auth"]
    user = User.find_by_uid(auth.uid) || User.create_from_omniauth(auth)
    session[:user_id] = user.id
    redirect_to users_home_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  def login
    if current_user
      redirect_to users_home_path
    else
      flash[:notice] = "Please login"
    end
  end

end