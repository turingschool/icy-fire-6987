require 'rails_helper'

RSpec.describe Chef, type: :model do

  describe "validations" do
      it {should validate_presence_of :name}
  end

  describe "relationships" do
      it {should have_many :dishes}
  end

  describe "instance methods" do
    describe "#unique_ingredients" do
      it "returns a list of unique ingredients that the chef uses" do
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

        chef_2 = Chef.create!(name: "Garrett Ramsay")
        dish_3 = Dish.create!(name: "Grilled Cheese Supreme", description: "A Sandwhich as old as time, so simple yet so delicious", chef_id: chef_2.id)
        ingredient_5 = Ingredient.create!(name: "Bacon", calories: 100)
        ingredient_6 = Ingredient.create!(name: "Lettuce", calories: 200)
        DishIngredient.create!(dish_id: dish_3.id, ingredient_id: ingredient_5.id)
        DishIngredient.create!(dish_id: dish_3.id, ingredient_id: ingredient_6.id)
        DishIngredient.create!(dish_id: dish_3.id, ingredient_id: ingredient_1.id)
        DishIngredient.create!(dish_id: dish_3.id, ingredient_id: ingredient_2.id)
        DishIngredient.create!(dish_id: dish_3.id, ingredient_id: ingredient_3.id)

        expect(chef.unique_ingredients).to eq([ingredient_1.name, ingredient_2.name, ingredient_3.name, ingredient_4.name])
        expect(chef.unique_ingredients).to_not include(ingredient_5.name)
        expect(chef.unique_ingredients).to_not include(ingredient_6.name)
      end
    end
  end

end