class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by_email params[:email]
    if user
      session[:user_id] = user.id
      redirect_to root_path, notice: "Signed In"
    else
      flash[:alert] = "Wrong credentials!"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Signed Out!"
  end
end
