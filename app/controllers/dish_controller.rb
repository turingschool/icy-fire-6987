class DishController < ApplicationController
  def index
    @dishes = Dish.all
  end
  
  def show 
    @dish = Dish.find(params[:id])
    @dish_calories = @dish.calorie_count
  end

  def new
  end

  def update
  end

  private

  def dish_params
    params.require(:dish).permit(:name, :description)
  end
end
