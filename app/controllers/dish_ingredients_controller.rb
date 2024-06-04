class DishIngredientsController < ApplicationController
  def create
    @dish = Dish.find(params[:dish_id])
    ingredient = Ingredient.find(dish_ingredient_params[:ingredient_id])
    
    DishIngredient.create(dish_id: params[:dish_id], ingredient_id: ingredient.id)
    redirect_to dish_path(params[:dish_id])
  end

  def dish_ingredient_params
    params.require(:dish_ingredient).permit(:ingredient_id)
  end
end