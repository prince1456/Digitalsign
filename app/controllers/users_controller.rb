class UsersController < ApplicationController
  layout "layouts/admin", only: [:show]

  def new
    @user = User.new
  end
  def show
    @user = User.find params[:id]
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to admin_path, notice: "Thanks for signing up"
    else
      flash[:alert] = "fix errors below"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name,
                                 :last_name,
                                 :email,
                                 :password,
                                 :user_name,
                                 :password_confirmation,
                                 :street_line
                                 )
  end
end
