require 'rails_helper'

RSpec.describe 'Chef Show page' do

  describe 'as a visitor' do
    it 'has a link that lists all the ingredients a chef uses' do
      chefA = Chef.create!(name: 'Ice Man')
      spag = chefA.dishes.create!(name: 'Spaghetti a la Marinara', description: 'Easy to make!')
      gbread = chefA.dishes.create!(name: 'Garlic bread', description: 'a perfect compliment to pasta')
      pasta = Ingredient.create!(name: 'Spaghetti', calories: 200)
      sauce = Ingredient.create!(name: 'Marinara', calories: 50)
      bread = Ingredient.create!(name: 'Bread', calories: 65)
      garlic = Ingredient.create!(name: 'Garlic', calories: 5)

      DishIngredient.create!(dish: spag, ingredient: pasta)
      DishIngredient.create!(dish: spag, ingredient: sauce)
      DishIngredient.create!(dish: gbread, ingredient: bread)
      DishIngredient.create!(dish: gbread, ingredient: garlic)

      visit "/chefs/#{chefA.id}"

      expect(page).to have_link("All Ingredients")
      click_link 'All Ingredients'
      expect(current_path).to eq("/chefs/#{chefA.id}/ingredients")
      expect(page).to have_content("Spaghetti")
      expect(page).to have_content("Marinara")
      expect(page).to have_content("Bread")
      expect(page).to have_content("Garlic")
      save_and_open_page

    end
  end
end
