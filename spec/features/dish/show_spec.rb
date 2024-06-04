require "rails_helper"

RSpec.describe "Dish Show Page" do
    describe "As A Visitor" do
    # As a visitor
    # When I visit a dish's show page
    # I see the dish’s name and description
    # And I see a list of ingredients for that dish
    # and a total calorie count for that dish
    # And I see the chef's name.
        scenario "I see the dish’s name and description, a list of ingredients for that dish, a total calorie count for that dish, and the chef's name" do
            chef = Chef.create!(name: "Gordon Ramsay")
            dish = Dish.create!(name: "Grilled Cheese", description: "A Sandwhich as old as time, so simple yet so delicious", chef_id: chef.id)
            ingredient_1 = Ingredient.create!(name: "Cheese", calories: 100)
            ingredient_2 = Ingredient.create!(name: "Bread", calories: 200)
            DishIngredient.create!(dish_id: dish.id, ingredient_id: ingredient_1.id)
            DishIngredient.create!(dish_id: dish.id, ingredient_id: ingredient_2.id)

            visit "/dishes/#{dish.id}"

            within("#dish_info") do
            expect(page).to have_content(dish.name)
            expect(page).to have_content(dish.description)
            expect(page).to have_content("Chef: #{chef.name}")
            expect(page).to have_content("Total Calories: 300")
            end

            within("#ingredients") do
            expect(page).to have_content(ingredient_1.name)
            expect(page).to have_content(ingredient_2.name)
            end
        end
    end
end