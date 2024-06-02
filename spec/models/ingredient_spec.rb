require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  before(:each) do
    @chef = Chef.create!(name: "John")
    @dish_1 = Dish.create!(name: "Amazing Steak", description: "The most amazing steak", chef_id: @chef.id)
    @ingredient_1 = Ingredient.create!(name: "Black Pepper", calories: 2)
    @ingredient_2 = Ingredient.create!(name: "Butter", calories: 50)

    DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_1.id)
    DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_2.id)
  end

  describe "relationships" do
      it { should have_many :dish_ingredients }
      it { should have_many(:dishes).through(:dish_ingredients)}
  end

  describe "class methods" do
    describe ".calorie_count" do
      it "should return the sum of calories from all ingredients" do
        expect(Ingredient.calorie_count).to eq(52)
      end
    end
  end
end