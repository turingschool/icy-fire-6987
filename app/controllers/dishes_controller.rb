class DishesController < ApplicationController
  def show
    @dish = Dish.find(params[:id])
  end

  def create
    Dish.create!
  end
end