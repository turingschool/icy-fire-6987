require "rails_helper"

RSpec.describe "dish show page" do
  before(:each) do
    @chef = Chef.create(name: "Gordon Ramsay")

    @dish = Dish.create(name: "Chicken and Rice", description: "simple recipe", chef_id: @chef.id)

    @ingredient1 = Ingredient.create(name: "Chicken Thigh", calories: 400)
    @ingredient2 = Ingredient.create(name: "Rice", calories: 300)
    @ingredient3 = Ingredient.create(name: "Teriyaki Sauce", calories: 200)
    @ingredient4 = Ingredient.create(name: "Scallions", calories: 100)

    DishIngredient.create(dish_id: @dish.id, ingredient_id: @ingredient1.id)
    DishIngredient.create(dish_id: @dish.id, ingredient_id: @ingredient2.id)
    DishIngredient.create(dish_id: @dish.id, ingredient_id: @ingredient3.id)
  end

  it "should display dish name and all dish ingredients" do
    visit dish_path(@dish)

    expect(page).to have_content("Name: Chicken and Rice")
    expect(page).to have_content("Ingredients: Chicken Thigh, Rice, and Teriyaki Sauce")
  end
end