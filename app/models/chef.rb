class Chef < ApplicationRecord
   validates_presence_of :name
   has_many :dishes
   has_many :ingredients, through: :dishes

   def self.unique_ingredients(chef_id)
      joins(dishes: :ingredients).where(chefs: { id: chef_id }).select("ingredients.*").distinct
   end
end