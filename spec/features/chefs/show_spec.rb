require "rails_helper"

RSpec.describe "chef show page" do
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

  it "should have a link to the ingredients index page" do
    visit chef_path(@chef)

    expect(page).to have_content("Name: Gordon Ramsay")

    click_link "See All Ingredients"

    expect(current_path).to eq(chef_ingredients_path(@chef))
  end
end