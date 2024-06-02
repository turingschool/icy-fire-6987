class DishIngredientsController < ApplicationController
  def create
    dish = Dish.find(params[:id])

    DishIngredient.create(ingredient_id: params[:ingredient_id], dish: dish)
    redirect_to "/dishes/#{dish.id}"
  end
end