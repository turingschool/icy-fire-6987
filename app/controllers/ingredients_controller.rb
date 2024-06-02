class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
    @chefs_ingredients = Ingredient.chefs_ingredients
  end
end