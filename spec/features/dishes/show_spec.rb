require 'rails_helper'

RSpec.describe 'Dish Show Page' do
  before do 
    chef1 = Chef.create(name: 'Gordon Ramsay')
    dish1 = chef1.dishes.create(name: 'Pizza', description: 'A delicious pizza')
    pepperoni = Ingredient.create(name: 'Pepperoni', calories: 100)
    cheese = Ingredient.create(name: 'Cheese', calories: 50)  
    dough = Ingredient.create(name: 'Dough', calories: 200)
    sauce = Ingredient.create(name: 'Sauce', calories: 75)
    DishIngredient.create(dish_id: dish1.id, ingredient_id: pepperoni.id)
    DishIngredient.create(dish_id: dish1.id, ingredient_id: cheese.id)
    DishIngredient.create(dish_id: dish1.id, ingredient_id: dough.id)
    DishIngredient.create(dish_id: dish1.id, ingredient_id: sauce.id)
    visit dish_path(dish1)
  end

  describe 'As a visitor' do
    it 'I see the dish name and description' do 
      expect(page).to have_content(dish.name)
      expect(page).to have_content(dish.description)
    end

    it 'displays a list of ingredients for the dish' do
      expect(page).to have_content('Ingredients')

      within('.ingredients') do
        expect(page).to have_content('Pepperoni')
        expect(page).to have_content('Cheese')
        expect(page).to have_content('Dough')
        expect(page).to have_content('Sauce')
      end
    end

    it 'displays the total calorie count for the dish' do
      within('.calories') do
        expect(page).to have_content('Total Calories: 425')
      end
    end
  end
end