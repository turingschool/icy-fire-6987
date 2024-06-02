require "rails_helper"

RSpec.describe "Dish Show Page" do
  before(:each) do
    @chef = Chef.create!(name: "John")
    @dish_1 = Dish.create!(name: "Amazing Steak", description: "The most amazing steak", chef_id: @chef.id)
    @ingredient_1 = Ingredient.create!(name: "Black Pepper", calories: 2)
    @ingredient_2 = Ingredient.create!(name: "Butter", calories: 50)

    DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_1.id)
    DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_2.id)

    visit dish_path(@dish_1.id)
  end

  describe "As a visitor, when I visit a dish's show page" do
    it "shows the dish's name and description" do
      within("div#dish_info") do
        expect(page).to have_content("Name: #{@dish_1.name}")
        expect(page).to have_content("Description: #{@dish_1.description}")
      end
    end

    it "shows a list of ingredients for the dish" do
      within("div#dish_info") do
          expect(page).to have_content("Ingredients: #{@dish_1.ingredients.first.name}", normalize_ws: true)
      end
    end

    it "shows a total calorie count for the dish" do
      within("div#dish_info") do
        expect(page).to have_content("Calorie Count: #{@dish_1.ingredients.calorie_count}")
      end
    end

    it "shows the name of the chef for the dish" do
      within("div#dish_info") do
        expect(page).to have_content("Chef: #{@chef.name}")
      end
    end
  end
end