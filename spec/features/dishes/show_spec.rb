require 'rails_helper'

RSpec.describe 'dish show page' do
  describe  "when I visit a dish's show page" do
    it "I see the dish's name and description" do
      chef = Chef.create!(name: "Jaque")
      dish = chef.dishes.create!(name: "Omlette", description: "Greek style")

      visit dish_path(dish)

      expect(page).to have_content("Omlette")
      expect(page).to have_content("Greek style")
    end

    it "I see a list of ingredients for that dish" do
      chef_1 = Chef.create!(name: "Jaque")
      dish_1 = chef_1.dishes.create!(name: "Omlette", description: "Greek style")
      ingredient_1 = Ingredient.create!(name: "egg", calories: 60)
      ingredient_2 = Ingredient.create!(name: "cheese", calories: 40)
      ingredient_3 = Ingredient.create!(name: "ice cream", calories: 100)
      DishIngredient.create!(dish: dish_1, ingredient: ingredient_1)
      DishIngredient.create!(dish: dish_1, ingredient: ingredient_2)

      visit dish_path(dish_1)
      
      expect(page).to have_content(ingredient_1.name) 
      expect(page).to have_content(ingredient_2.name)
      expect(page).to_not have_content(ingredient_3.name)
    end

    it "I see a total calorie count for that dish" do
      chef_1 = Chef.create!(name: "Jaque")
      dish_1 = chef_1.dishes.create!(name: "Omlette", description: "Greek style")
      ingredient_1 = Ingredient.create!(name: "egg", calories: 60)
      ingredient_2 = Ingredient.create!(name: "cheese", calories: 40)
      DishIngredient.create!(dish: dish_1, ingredient: ingredient_1)
      DishIngredient.create!(dish: dish_1, ingredient: ingredient_2)

      visit dish_path(dish_1)
      
      expect(page).to have_content(100)
    end
  end
end