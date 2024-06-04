require "rails_helper"

RSpec.describe "Chef Show Page" do
    describe "As A Visitor" do
        scenario "I see a link to view a list of all ingredients that this chef uses in their dishes, click on that link, and see a unique list of names of all the ingredients that this chef uses" do
            chef = Chef.create!(name: "Gordon Ramsay")
            dish_1 = Dish.create!(name: "Grilled Cheese", description: "A Sandwhich as old as time, so simple yet so delicious", chef_id: chef.id)
            dish_2 = Dish.create!(name: "Pasta", description: "A classic dish", chef_id: chef.id)
            ingredient_1 = Ingredient.create!(name: "Cheese", calories: 100)
            ingredient_2 = Ingredient.create!(name: "Bread", calories: 200)
            ingredient_3 = Ingredient.create!(name: "Tomato", calories: 50)
            ingredient_4 = Ingredient.create!(name: "Alfredo Sauce", calories: 300)
            DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_1.id)
            DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_2.id)
            DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_3.id)
            DishIngredient.create!(dish_id: dish_2.id, ingredient_id: ingredient_2.id)
            DishIngredient.create!(dish_id: dish_2.id, ingredient_id: ingredient_4.id)

            visit "/chefs/#{chef.id}"

            click_on "View Ingredients"

            expect(current_path).to eq("/chefs/#{chef.id}/ingredients")

            expect(page).to have_content(ingredient_1.name)
            expect(page).to have_content(ingredient_2.name)
            expect(page).to have_content(ingredient_3.name)
            expect(page).to have_content(ingredient_4.name)
        end
    end
end