require "rails_helper"

RSpec.describe "Dish Show Page" do
    before :each do
        @chef = Chef.create!(name: "James May")
        @dish1 = @chef.dishes.create!(name: "Spaghetti", description: "Pasta with a touch of ground beef and red sauce")
        @dish2 = @chef.dishes.create!(name: "Meatballs", description: "Our famous ground beef with parmesan cheese")
        @ingredient1 = Ingredient.create!(name: "Pasta", calories: 200)
        @ingredient2 = Ingredient.create!(name: "Ground Beef", calories: 300)
        @ingredient3 = Ingredient.create!(name: "Tomato Sauce", calories: 100)
        @ingredient4 = Ingredient.create!(name: "Parmesan Cheese", calories: 150)
        @dish1.ingredients << [@ingredient1, @ingredient2, @ingredient3]
        @dish2.ingredients << [@ingredient2, @ingredient4]
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

    it "should show a form to add an existing ingredient" do
        visit dish_path(@dish)

        expect(page).to have_selector("form")
        expect(page).to have_field("Ingredient ID")
    end

    it "should add an existing ingredient to the dish" do
        visit dish_path(@dish)

        fill_in "Ingredient ID", with: @ingredient4.id
        click_button "Add Ingredient"

        expect(current_path).to eq(dish_path(@dish))
        expect(page).to have_content(@ingredient4.name)
    end

    it "should show a link to a list of all ingredients" do
        visit chef_path(@chef)

        expect(page).to have_link("See all Ingredients")
    end

    it "should show the chef's ingredients" do
        visit chef_path(@chef)

        click_link "See all Ingredients"

        expect(current_path).to eq(chef_ingredients_path(@chef))
        expect(page).to have_content(@ingredient1.name)
        expect(page).to have_content(@ingredient2.name)
        expect(page).to have_content(@ingredient3.name)
        expect(page).to have_content(@ingredient4.name)
    end
end