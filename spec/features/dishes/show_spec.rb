require "rails_helper"

RSpec.describe "the dishes show page" do

  before :each do
    @chef1 = Chef.create!(name: "Chee")
    @dish1 = @chef1.create!(name: "Grilled Cheese", description: "Bread and cheese, grilled")
    @ingredient1 = Ingredient.create!(name:"Bread", calories: 50)
    @ingredient2 = Ingredient.create!(name:"Cheese", calories: 100)

  end

# As a visitor
# When I visit a dish's show page
# I see the dish’s name and description
# And I see a list of ingredients for that dish
# and a total calorie count for that dish
# And I see the chef's name.
  describe "US 1" do

    xit "When I visit a dish's show page
    I see the dish’s name and description
    And I see a list of ingredients for that dish
    and a total calorie count for that dish
    And I see the chef's name." do
      visit "/dishes/:id"

      expect(page).to have_content("Name: #{@dish1.name}")
      expect(page).to have_content("Description: #{@dish1.description}")
      expect(page).to have_content("Ingredients: #{@ingredient1.name}", "#{@ingredient2.name}")
      expect(page).to have_content("Calorie Count: #{@dish.calories}")
    end
  end

end