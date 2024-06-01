require 'rails_helper'

RSpec.describe Dish, type: :model do

  describe "validations" do
      it {should validate_presence_of :name}
      it {should validate_presence_of :description}
  end

  describe "relationships" do
      it {should belong_to :chef}
      it {should have_many :ingredients}
  end

  before :each do
    @chef1 = Chef.create!(name: "Chee")
    @dish1 = @chef1.dishes.create!(name: "Grilled Cheese", description: "Bread and cheese, grilled")
    @ingredient1 = Ingredient.create!(name:"Bread", calories: 50)
    @ingredient2 = Ingredient.create!(name:"Cheese", calories: 100)
    DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient1.id)
    DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient2.id)
  end

  describe "instance methods" do
    it "can calculate calories of dish" do
      expect(@dish1.calories).to eq(150)
    end
  end
end