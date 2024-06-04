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
      end
      it "I see the dish's name, description, ingredients, calorie count, and chef's name" do
        # require 'pry'; binding.pry
        visit "/dishes/#{@dish.id}"
        # save_and_open_page
        # expect(page).to have_content(@dish.name)


      end
    end
  end
end