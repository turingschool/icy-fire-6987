require 'rails_helper'

RSpec.describe 'dish show page' do
  describe  "when I visit a dish's show page" do
    it "I see the dish's name and description" do
      chef = Chef.create!(name: "Jaque")
      dish = chef.dishes.create!(name: "Omlette", description: "Greek style")

      visit dish_path(dish)

      expect(page).to have_content("Omlette")
      expect(page).to have_content("Greek style")
    end
  end
end