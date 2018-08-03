class SessionsController < ApplicationController

  def create 
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to ideas_path
    else
      flash[:errors] = ["Invalid Email / Password Combination"]
      redirect_to :back
    end
  end

  def logout
    reset_session
    redirect_to "/"
  end
end
