class DishIngredient < ApplicationRecord
  belongs_to :dish
  belongs_to :ingredient
  # has_many :dish
  # has_many :ingredients

end