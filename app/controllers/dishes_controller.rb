class DishesController < ApplicationController

  def show
    @dish = Dish.find(params[:id])
    @ingredient = @dish.ingredients.find(params[:id])
  end

end