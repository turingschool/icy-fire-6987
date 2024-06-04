class Ingredient < ApplicationRecord
  has_many :ingredients_dishes
  has_many :dishes, through: :ingredient_dishes
end