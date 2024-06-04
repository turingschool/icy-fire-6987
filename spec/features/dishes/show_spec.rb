require "rails_helper"

RSpec.describe "Dish Show Page" do
    before :each do
        @chef = Chef.create!(name: "James May")
        @dish = @chef.dishes.create!(name: "Spaghetti", description: "Pasta with a touch of ground beef and red sauce")
        @ingredient1 = Ingredient.create!(name: "Pasta", calories: 200)
        @ingredient2 = Ingredient.create!(name: "Ground Beef", calories: 300)
        @ingredient3 = Ingredient.create!(name: "Tomato Sauce", calories: 100)
        @dish.ingredients << [@ingredient1, @ingredient2, @ingredient3]
    end

    it "should show the dish with the description" do
        visit dish_path(@dish)

        expect(page).to have_content(@dish.name)
        expect(page).to have_content(@dish.description)
    end

    it "should show a list of ingredients" do
        visit dish_path(@dish)

        @dish.ingredients. each do |ingredient|
            expect(page).to have_content(ingredient.name)
        end
    end

    it "should show the total amount of calories" do
        visit dish_path(@dish)

        expect(page).to have_content("Total Calories: 600")
    end

    it "should show the chef's name" do
        visit dish_path(@dish)

        expect(page).to have_content(@chef.name)
    end
end