class DropTableDishIngredients < ActiveRecord::Migration[7.1]
  def change
    drop_table :table_dish_ingredients
  end
end
