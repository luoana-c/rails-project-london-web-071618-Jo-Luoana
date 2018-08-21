class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end

  def show
    set_ingredient
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to ingredient_path(@ingredient)
    else
      render :new
    end
  end

  def edit
    set_ingredient
  end

  def update
    set_ingredient
    if @ingredient.update(ingredient_params)
      redirect_to ingredient_path(@ingredient)
    else
      render :edit
    end
  end

  def destroy
    set_ingredient
    @ingredient.destroy
    redirect_to ingredients_path
  end

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name, :unit_type)
  end
end
