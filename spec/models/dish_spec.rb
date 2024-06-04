require 'rails_helper'

RSpec.describe Dish, type: :model do

  describe "validations" do
      it {should validate_presence_of :name}
      it {should validate_presence_of :description}
  end

  describe "relationships" do
      it {should belong_to :chef}
      it {should have_many :dish_ingredients}
      it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  describe "instance methods" do
    describe "#total_calories" do
      it "can calculate the total calories for a dish" do
        chef = Chef.create!(name: "Gordon Ramsay")
        dish = Dish.create!(name: "Grilled Cheese", description: "A Sandwhich as old as time, so simple yet so delicious", chef_id: chef.id)
        ingredient_1 = Ingredient.create!(name: "Cheese", calories: 100)
        ingredient_2 = Ingredient.create!(name: "Bread", calories: 200)
        DishIngredient.create!(dish_id: dish.id, ingredient_id: ingredient_1.id)
        DishIngredient.create!(dish_id: dish.id, ingredient_id: ingredient_2.id)

        expect(dish.total_calories).to eq(300)
      end
    end
  end

end