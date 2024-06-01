class DishIngredientsController < ApplicationController
  def create
    @dish = Dish.find(params[:dish_id])
    @ingredient = Ingredient.where("name ILIKE ?", "%#{params[:ingredient]}%").first
  
    DishIngredient.create!(dish_id: @dish.id, ingredient_id: @ingredient.id)
  
    redirect_to "/dishes/#{@dish.id}"
    end
end