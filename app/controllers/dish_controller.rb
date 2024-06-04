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
    @dish = Dish.find(params[:id])
    ingredient = Ingredient.find(params[:ingredient_id])
    
    @dish.ingredients << ingredient
    redirect_to @dish
  end
  
  private

  def dish_params
    params.permit(:name, :description)
  end
end
