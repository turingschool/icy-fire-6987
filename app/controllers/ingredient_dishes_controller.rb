class IngredientDishesController < ApplicationController
  def create
    dish = Dish.find(params[:id])
    ingredient = Ingredient.find(params[:ingredient_id])
    IngredientDish.create(ingredient: ingredient, dish: dish)
    redirect_to "/dishes/#{dish.id}"
  end
end
