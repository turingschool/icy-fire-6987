require "rails_helper"

RSpec.describe "Dish Show Page" do
    describe "As A Visitor" do
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
        # As a visitor
        # When I visit a dish's show page
        # I see a form to add an existing Ingredient to that Dish
        # When I fill in the form with the ID of an Ingredient that exists in the database
        # And I click Submit
        # Then I am redirected to that dish's show page
        # And I see that ingredient is now listed. 
            scenario "I see a form to add an existing Ingredient to that Dish, fill in the form with the ID of an Ingredient that exists in the database, click Submit, and see that ingredient is now listed" do
                chef = Chef.create!(name: "Gordon Ramsay")
                dish = Dish.create!(name: "Grilled Cheese", description: "A Sandwhich as old as time, so simple yet so delicious", chef_id: chef.id)
                ingredient_1 = Ingredient.create!(name: "Cheese", calories: 100)
                ingredient_2 = Ingredient.create!(name: "Bread", calories: 200)
                ingredient_3 = Ingredient.create!(name: "Tomato", calories: 50)
                DishIngredient.create!(dish_id: dish.id, ingredient_id: ingredient_1.id)

                visit "/dishes/#{dish.id}"

                within("#add_ingredient") do
                    fill_in :ingredient_id, with: ingredient_3.id
                    click_on "Add Ingredient"
                end

                expect(current_path).to eq("/dishes/#{dish.id}")

                within("#ingredients") do
                    expect(page).to have_content(ingredient_1.name)
                    expect(page).to have_content(ingredient_2.name)
                    expect(page).to have_content(ingredient_3.name)
                end
            end
    end
end