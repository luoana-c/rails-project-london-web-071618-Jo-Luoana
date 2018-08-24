class RecipesController < ApplicationController
  def index
    if params[:name]
      @recipes = Recipe.where("name like ?", "%#{params[:name]}%")
    elsif params[:cuisine_type]
      @recipes = Recipe.where("cuisine_type like ?", "%#{params[:cuisine_type]}%")
    else
    @recipes = Recipe.all
    end
  end

  def show
    set_recipe
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params(:name, :cuisine_type, :price, ingredient_ids:[]))
    @recipe.user = current_user
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def edit
    set_recipe
    recipe_user_id = @recipe.user.id
    authorized_for(recipe_user_id)
  end

  def update
    set_recipe
    if @recipe.update(recipe_params(:name, :cuisine_type, :price, ingredient_ids:[]))
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  def destroy
    set_recipe
    @recipe.destroy
    redirect_to recipes_path
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params(*args)
    params.require(:recipe).permit(*args)
  end
end
