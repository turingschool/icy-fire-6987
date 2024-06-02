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


    visit chef_path(@chef.id)
  end

  describe "As a visitor, when I visit a chef's show page" do
    it "shows a link to view a list of all ingredients this chef uses in their dishes" do
      within("div#ingredients_link") do
        expect(page).to have_link("Ingredients Used")
      end
    end

    it "the link directs to the chef's ingredients index page" do
      within("div#ingredients_link") do
        click_link("Ingredients Used")

        expect(current_path).to eq(chef_ingredients_path(@chef.id))
      end
    end
  end
end