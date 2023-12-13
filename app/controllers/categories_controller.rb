
class CategoriesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def create
    @category = Category.new category_params
    @category.user = current_user

    if @category.save
      redirect_to categories_path, notice: 'Categoria cadastrada com sucesso'
    else
      render :new
    end
  end

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def recipes
    category = Category.find params[:category_id]
    @recipes = category.recipes
  end


  private

  def category_params
    params.require(:category).permit :name
  end
end
