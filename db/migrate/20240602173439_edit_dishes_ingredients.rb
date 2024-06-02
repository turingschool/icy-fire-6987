class EditDishesIngredients < ActiveRecord::Migration[7.1]
  def change
    rename_table :dishes_ingredients, :dish_ingredients
  end
end
