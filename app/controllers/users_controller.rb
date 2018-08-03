class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @ideas = User.joins(:ideas).select("COUNT(ideas.id) as count").find(params[:id])
  end

  def index
  end

  def create
    user = User.new(user_params)

    if user.save
      # go to success page
      session[:user_id] = user.id
      redirect_to ideas_path
    else
      flash[:errors] = user.errors.full_messages
      redirect_to :back
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :alias, :email, :password, :password_confirmation)
    end
end
