class IngredientsController < ApplicationController
  def create
    @dish = Dish.find(params[:dish_id])
    @ingredient = Ingredient.find(params[:ingredient_id])
    new_ingredient = DishIngredient.create(dish_id: @dish.id, ingredient_id: @ingredient.id)


    redirect_to dish_path(@dish)
  end

  def index
    @chef = Chef.find(params[:chef_id])
    @ingredients = @chef.ingredients
  end
end