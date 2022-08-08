class RecipesController < ApplicationController

  def create
    new_recipe = current_user.recipes.create!(recipe_params)
    render json: new_recipe , status: :created
  end 

  def index
    recipes = Recipe.all
    render json: recipes , status: :created
  end 

  private

  def recipe_params
    params.permit(:title , :instructions ,:minutes_to_complete)
  end 
end
