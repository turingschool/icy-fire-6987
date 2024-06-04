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
    ingredient = Ingredient.find(params[:dish][:ingredient_id])
    
    if @dish.ingredients << ingredient
      redirect_to @dish, notice: 'Ingredient was successfully added.'
    else
      redirect_to @dish, alert: 'Failed to add ingredient.'
    end
  end
  
  private

  def dish_params
    params.require(:dish).permit(:name, :description)
  end
end
