class DishesController < ApplicationController
  def show
    @dish = Dish.find(params[:id])
    @all_ingredient_names = @dish.all_ingredient_names
  end
end