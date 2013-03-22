class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      user = User.find_by_email(@user.email)
      session[:user_id] = user.id
      redirect_to root_path, :notice => "Your are now signed up!"
    else
      render "new"
    end
  end
end
