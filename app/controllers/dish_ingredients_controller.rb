class DishIngredientsController < ApplicationController
    def create
        @dish = Dish.find(params[:dish_id])
        @ingredient = Ingredient.find(params[:ingredient_id])
        @dish.add_ingredient(@ingredient.id)

        redirect_to dish_path(@dish)
    end
end