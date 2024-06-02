class Ingredient < ApplicationRecord
  has_many :dish_ingredients
  has_many :dishes, through: :dish_ingredients

  def self.calorie_count
    sum(:calories)
  end

  def self.chefs_ingredients
  end
end