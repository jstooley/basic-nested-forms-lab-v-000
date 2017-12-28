class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(ingredient_name: '')
    @recipe.ingredients.build(ingredient_name: '')
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to @recipe
    else
      render :new
    end
  end

  private

  def recipe_params(params)
    params.require(:recipe).permit(:title,
      ingredients_attributes: [
        :ingredient_name,
        :ingredient_quantity
      ]
    )
  end
end
