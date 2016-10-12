class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]
  layout "layouts/admin"
  before_action :authorize!, only: [:destroy, :update, :edit]
  def index
    # @pages = Page.all
    @page = Page.new
    @templates = Template.all
    @user = current_user
    @pages = @user.pages.all
  end

  def show
  end

  def new
    @page = Page.new
    @templates = Template.all
  end

  def edit
  end

  def create
    @page = Page.new(page_params)
    @page.user = current_user
    respond_to do |format|
      if @page.save
        format.html { redirect_to @page, notice: 'Page was successfully created.' }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to pages_url, notice: 'Page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_page
      @page = Page.find(params[:id])
    end

    def page_params
      params.require(:page).permit(:page_name, :page_body, :user_id, :template_id, :image)
    end

    def authorize!
      redirect_to root_path, alert: 'access defined' unless can? :manage, @page
    end
end
