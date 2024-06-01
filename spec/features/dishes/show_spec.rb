require "rails_helper"

RSpec.describe "the dishes show page" do

  before :each do
    @chef1 = Chef.create!(name: "Chee")
    @dish1 = @chef1.dishes.create!(name: "Grilled Cheese", description: "Bread and cheese, grilled")
    @ingredient1 = Ingredient.create!(name:"Bread", calories: 50)
    @ingredient2 = Ingredient.create!(name:"Cheese", calories: 100)
    @ingredient3 = Ingredient.create!(name:"Bacon", calories: 200)
    DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient1.id)
    DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient2.id)
  end

  describe "US 1" do

    it "When I visit a dish's show page
    I see the dish’s name and description
    And I see a list of ingredients for that dish
    and a total calorie count for that dish
    And I see the chef's name." do
      visit "/dishes/#{@dish1.id}"

      expect(page).to have_content("Name: #{@dish1.name}")
      expect(page).to have_content("Description: #{@dish1.description}")
      expect(page).to have_content("Ingredients: #{@ingredient1.name}, #{@ingredient2.name}")
      expect(page).to have_content("Calorie Count: #{@dish1.calories}")
      expect(page).to have_content("Chef: #{@dish1.chef.name}")
    end
  end

  describe "US 2" do

    it "When I visit a dish's show page
    I see a form to add an existing Ingredient to that Dish
    When I fill in the form with the ID of an Ingredient that exists in the database
    And I click Submit
    Then I am redirected to that dish's show page
    And I see that ingredient is now listed." do
      visit "/dishes/#{@dish1.id}"

      expect(find("form")).to have_content("Add ingredient")

      fill_in "ingredient", with: "#{@ingredient3.name}"
      click_on "Submit"
# save_and_open_page
      expect(page).to have_content("Name: #{@dish1.name}")
      expect(page).to have_content("Description: #{@dish1.description}")
      expect(page).to have_content("Ingredients: #{@ingredient1.name}, #{@ingredient2.name}, #{@ingredient3.name}")
      expect(page).to have_content("Calorie Count: #{@dish1.calories}")
      expect(page).to have_content("Chef: #{@dish1.chef.name}")
    end
  end

end