require 'rails_helper'

RSpec.describe Chef, type: :model do

  describe "validations" do
      it {should validate_presence_of :name}
  end

  describe "relationships" do
      it {should have_many :dishes}
      it {should have_many(:ingredients).through(:dishes)}
  end

  before :each do
    @chef1 = Chef.create!(name: "Chee")
    @dish1 = @chef1.dishes.create!(name: "Grilled Cheese", description: "Bread and cheese, grilled")
    @ingredient1 = Ingredient.create!(name:"Bread", calories: 50)
    @ingredient2 = Ingredient.create!(name:"Cheese", calories: 100)
    @ingredient3 = Ingredient.create!(name:"Bacon", calories: 200)
    DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient1.id)
    DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient2.id)
    DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient2.id)
  end

  describe "instance methods" do
    it "can return chef's used ingredients" do
      expect(@chef1.ingredient_list).to eq([@ingredient1, @ingredient2])
    end
  end
end