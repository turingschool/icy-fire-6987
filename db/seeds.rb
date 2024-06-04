# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@chef = Chef.create(name: "Gordon Ramsay")

@dish = Dish.create(name: "Chicken and Rice", description: "simple recipe", chef_id: @chef.id)

@ingredient1 = Ingredient.create(name: "Chicken Thigh", calories: 400)
@ingredient2 = Ingredient.create(name: "Rice", calories: 300)
@ingredient3 = Ingredient.create(name: "Teriyaki Sauce", calories: 200)
@ingredient4 = Ingredient.create(name: "Scallions", calories: 100)

DishIngredient.create(dish_id: @dish.id, ingredient_id: @ingredient1.id)
DishIngredient.create(dish_id: @dish.id, ingredient_id: @ingredient2.id)
DishIngredient.create(dish_id: @dish.id, ingredient_id: @ingredient3.id)