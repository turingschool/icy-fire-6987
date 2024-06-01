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

  describe "US 3" do
    it "As a visitor
    When I visit a chef's show page
    I see a link to view a list of all ingredients that this chef uses in their dishes.
    When I click on that link
    I'm taken to a chef's ingredients index page
    and I can see a unique list of names of all the ingredients that this chef uses." do
      visit "/chefs/#{@chef1.id}"

      expect(page).to have_link("Ingredients")

      click_on "Ingredients"

      expect(page).to have_current_path("/chefs/#{@chef1.id}/ingredients")

      expect(page).to have_content("Name: #{@ingredient1.name}")
      expect(page).to have_content("Name: #{@ingredient2.name}")
      expect(page).to_not have_content("Name: #{@ingredient3.name}")
    end
  end

end