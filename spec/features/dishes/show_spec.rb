require "rails_helper"

RSpec.describe "Dish Show Page", type: :feature do
  describe "As a visitor" do
    describe "When I visit a dish's show page" do
      before(:each) do
        @chef = Chef.create!(name: "Guy Fieri")
        @chef2 = Chef.create!(name: "Gordon Ramsey")

        @dish = @chef.dishes.create!(name: "Chicken Parm", description: "Breaded chicken with tomato sauce and fresh mozzarella")
        @dish2 = @chef2.dishes.create!(name: "Taco", description: "Pulled Pork and Slaw on Soft Taco Shell")
    
        @ingredient = Ingredient.create!(name: "Chicken", calories: 200)
        @ingredient2 = Ingredient.create!(name: "Mozzarella Cheese", calories: 100)
        @ingredient3 = Ingredient.create!(name: "Tomato Sauce", calories: 80)

        @ingredient4 = Ingredient.create!(name: "Pulled Pork", calories: 400)
        @ingredient5 = Ingredient.create!(name: "Coleslaw", calories: 250)
        @ingredient6 = Ingredient.create!(name: "Soft Taco Shell", calories: 150)
        IngredientDish.create!(ingredient: @ingredient, dish: @dish)
        IngredientDish.create!(ingredient: @ingredient2, dish: @dish)
        IngredientDish.create!(ingredient: @ingredient3, dish: @dish)
      end
# As a visitor
# When I visit a dish's show page
# I see the dish’s name and description
# And I see a list of ingredients for that dish
# and a total calorie count for that dish
# And I see the chef's name.
      it "I see the dish's name, description, ingredients, calorie count, and chef's name" do
        visit "/dishes/#{@dish.id}"

        expect(page).to have_content("Dish: #{@dish.name}")
        expect(page).to have_content(@dish.description)
        expect(page).to have_content(@chef.name)
        expect(page).to have_content(@ingredient.name)
        expect(page).to have_content(@ingredient2.name)
        expect(page).to have_content(@ingredient3.name)

        total_calories = (@ingredient.calories + @ingredient2.calories + @ingredient3.calories) 
        expect(page).to have_content(total_calories)
      end
# As a visitor
# When I visit a dish's show page
# I see a form to add an existing Ingredient to that Dish
# When I fill in the form with the ID of an Ingredient that exists in the database
# And I click Submit
# Then I am redirected to that dish's show page
# And I see that ingredient is now listed. 
      it "allows me to add ingredients by ID" do
        visit "/dishes/#{@dish.id}"
      
        fill_in :ingredient_id, with: @ingredient4.id
        
        click_button :submit

        expect(current_path).to eq("/dishes/#{@dish.id}")
        expect(page).to have_content(@ingredient4.name)
      end
    end
  end
end