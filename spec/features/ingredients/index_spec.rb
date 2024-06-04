require "rails_helper"

RSpec.describe "chef ingredient index page" do
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

  it "should have a list of all the chef's used ingredients" do
    visit chef_ingredients_path(@chef)

    expect(page).to have_content("Gordon Ramsay Ingredients")
    expect(page).to have_content("Chicken Thigh")
    expect(page).to have_content("Rice")
    expect(page).to have_content("Teriyaki Sauce")
  end
end