class DishIngredientsController < ApplicationController
  def create
    DishIngredient.create!(dish_id: params[:dish_id], ingredient_id: params[:ingredient_id])
    binding.pry

    redirect_to dish_path(params[:dish_id])
  end
end