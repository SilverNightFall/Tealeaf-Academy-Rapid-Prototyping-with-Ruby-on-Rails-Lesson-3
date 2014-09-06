class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category was created."
      redirect_to categories_path
    else
      render :new
    end
  end

  def update
    if @category.update(category_params)
      flash[:notice] = "Category was updated."
      redirect_to category_path(@category)
    else
      render :index
    end
  end

  def destroy
    @category.destroy
    flash[:notice] = "Category was destroyed."
    redirect_to category_url
  end

private

def set_category
   @category = Category.find(params[:id])
end

def category_params
  params.require(:category).permit(:name)
end
end