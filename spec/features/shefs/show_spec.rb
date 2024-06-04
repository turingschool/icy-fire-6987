require 'rails_helper'

RSpec.describe 'Chef Show Page' do
  before do
    @chef1 = Chef.create(name: 'Gordon Ramsay')
    @dish1 = @chef1.dishes.create(name: 'Pizza', description: 'A delicious pizza')
    @pepperoni = Ingredient.create(name: 'Pepperoni', calories: 100)
    @cheese = Ingredient.create(name: 'Cheese', calories: 50)  
    @dough = Ingredient.create(name: 'Dough', calories: 200)
    @sauce = Ingredient.create(name: 'Sauce', calories: 75)
    @chicken = Ingredient.create(name: 'Chicken', calories: 150)
    DishIngredient.create(dish_id: @dish1.id, ingredient_id: @pepperoni.id)
    DishIngredient.create(dish_id: @dish1.id, ingredient_id: @cheese.id)
    DishIngredient.create(dish_id: @dish1.id, ingredient_id: @dough.id)
    DishIngredient.create(dish_id: @dish1.id, ingredient_id: @sauce.id)
    visit chef_path(@chef1)
  end

  describe 'as a visitor' do
    it 'has a link to all a chefs ingredients' do
      expect(page).to have_content("Ingredients")

      expect(current_path).to eq(chef_ingredients_path(@chef1))
    end
  end
end