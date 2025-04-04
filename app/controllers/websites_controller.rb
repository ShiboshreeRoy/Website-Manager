class WebsitesController < ApplicationController
  before_action :authenticate_manager!, except: [:index, :show]
  before_action :set_website, only: [:show, :edit, :update, :destroy]

  def index
    @websites = Website.all
    @website = Website.all
  end

  def show; end

  def new
    @website = Website.new
  end

  def create
    @website = current_manager.websites.build(website_params)
    if @website.save
      redirect_to @website, notice: "Website added successfully."
    else
      render :new
    end
  end
  

  def edit; end

  def update
    if @website.update(website_params)
      redirect_to @website, notice: "Website updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @website.destroy
    redirect_to websites_path, notice: "Website deleted successfully."
  end

  private

  def set_website
    @website = Website.find(params[:id])
  end

  def website_params
    params.require(:website).permit(:name, :url, :description)
  end
end
