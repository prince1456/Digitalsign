class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

    def authenticate_user!
      redirect_to new_session_path, notice: "please sign in" unless user_signed_in?

    end

    def user_signed_in?
      current_user.present?
    end
    helper_method :user_signed_in?

    def current_user
      @current_user ||= User.find_by_id session[:user_id]
    end
    helper_method :current_user
    end
