require 'rails_helper'

RSpec.describe 'Dish Show Page' do
  before do 
    dish = Dish.create(name: 'Pizza', description: 'Delicious, pepperoni, cheese, sauce, dough')
    pepperoni = Ingredient.create(name: 'Pepperoni', calories: 100)
    cheese = Ingredient.create(name: 'Cheese', calories: 50)  
    dough = Ingredient.create(name: 'Dough', calories: 200)
    sauce = Ingredient.create(name: 'Sauce', calories: 75)
    create(:dish_ingredient, dish: dish, ingredient: pepperoni)
    create(:dish_ingredient, dish: dish, ingredient: cheese)
    create(:dish_ingredient, dish: dish, ingredient: dough)
    create(:dish_ingredient, dish: dish, ingredient: sauce)

    visit "/dishes/#{dish.id}"
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