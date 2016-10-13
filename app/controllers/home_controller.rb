class HomeController < ApplicationController
layout "layouts/splash", only: [:index]
def index
@users = User.all
@user= User.new


end


end
