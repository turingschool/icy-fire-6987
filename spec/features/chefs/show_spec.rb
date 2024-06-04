require 'rails_helper'
RSpec.describe 'chef show page' do
  
  describe  "when I visit a chef's show page" do
    it "I see a link to view a list of all ingredients that this chef uses in their dishes" do
      chef_1 = Chef.create!(name: "Jaque")
     
      visit chef_path(chef_1)

      expect(page).to have_link("Chefs Ingredients")
    end
    
    it "link takes me to chef's ingredients index page and I see unique list of names of all the ingredients that this chef uses" do
      chef_1 = Chef.create!(name: "Jaque")
      dish_1 = chef_1.dishes.create!(name: "Omlette", description: "Greek style")
      dish_2 = chef_1.dishes.create!(name: "Twist", description: "soft serve")
      ingredient_1 = Ingredient.create!(name: "egg", calories: 60)
      ingredient_2 = Ingredient.create!(name: "cheese", calories: 40)
      ingredient_3 = Ingredient.create!(name: "chocolate ice cream", calories: 100)
      ingredient_4 = Ingredient.create!(name: "vanilla ice cream", calories: 100)
      DishIngredient.create!(dish: dish_1, ingredient: ingredient_1)
      DishIngredient.create!(dish: dish_1, ingredient: ingredient_2)
      DishIngredient.create!(dish: dish_2, ingredient: ingredient_3)
      DishIngredient.create!(dish: dish_2, ingredient: ingredient_4)

      visit chef_path(chef_1)
      click_link "Chefs Ingredients"

      expect(current_path).to eq(chef_ingredients_path)
      expect(page).to have_link("Chefs Ingredients")
    end


  end

end
