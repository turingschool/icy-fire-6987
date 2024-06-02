require "rails_helper"

RSpec.describe "Chef Show Page" do
  before(:each) do
    @chef = Chef.create!(name: "John")
    @dish_1 = Dish.create!(name: "Amazing Steak", description: "The most amazing steak", chef_id: @chef.id)
    @ingredient_1 = Ingredient.create!(name: "Black Pepper", calories: 2)
    @ingredient_2 = Ingredient.create!(name: "Butter", calories: 50)
    @ingredient_3 = Ingredient.create!(id: 3, name: "Salt", calories: 50)

    DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_1.id)
    DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_2.id)
    DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_3.id)


    visit chef_ingredients_path(@chef.id)
  end

  describe "As a visitor, when I visit a chef's ingredients index page" do
    it "shows a unique list of all ingredient's names" do
      within("div#ingredient_names") do
        expect(page).to have_content("Black Pepper")
        expect(page).to have_content("Butter")
        expect(page).to have_content("Salt")
      end
    end
  end
end