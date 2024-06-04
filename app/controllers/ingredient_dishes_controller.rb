class IngredientDishesController < ApplicationController
  def create
    ingredient = Ingredient.find(params[:id])
    dish = Dish.find(params[:id])
    IngredientDish.create(ingredient: ingredient, dish: dish)
    redirect_to "/dishes/#{dish.id}"
  end
end
