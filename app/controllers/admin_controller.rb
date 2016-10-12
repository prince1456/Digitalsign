class AdminController < ApplicationController

  def admin
    @user = User.all
    @user2 = User.where("created_at >= ?", Time.zone.now.beginning_of_day)
    @templates = Template.all
    @pages = Page.all
    @page =Template.where("created_at >= ?", Time.zone.now.beginning_of_day)
  end
end
