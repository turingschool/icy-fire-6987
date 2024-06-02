require 'rails_helper'

RSpec.describe 'the show dishes page' do
  describe 'as a visitor' do
    it 'shows all details for a dish' do
      chefA = Chef.create!(name: 'Ice Man')
      spag = chefA.dishes.create!(name: 'Spaghetti a la Marinara', description: 'Easy to make!')
      pasta = Ingredient.create!(name: 'Spaghetti', calories: 200)
      sauce = Ingredient.create!(name: 'Marinara', calories: 50)
      DishIngredient.create!(dish: spag, ingredient: pasta)
      DishIngredient.create!(dish: spag, ingredient: sauce)

      visit "/dishes/#{spag.id}"
      save_and_open_page
      expect(page).to have_content(spag.name)
      expect(page).to have_content("Description: #{spag.description}")
      expect(page).to have_content("Total Calories: 250")

      spag.ingredients.each do |ingredient|
        expect(page).to have_content("Ingredient name: #{ingredient.name}")
        expect(page).to have_content("Calories: #{ingredient.calories}")
      end
    end
  end
end