require 'rails_helper'

RSpec.describe 'Dish Show Page' do
  before do 
    @chef1 = Chef.create(name: 'Gordon Ramsay')
    @dish1 = @chef1.dishes.create(name: 'Pizza', description: 'A delicious pizza')
    @pepperoni = Ingredient.create(name: 'Pepperoni', calories: 100)
    @cheese = Ingredient.create(name: 'Cheese', calories: 50)  
    @dough = Ingredient.create(name: 'Dough', calories: 200)
    @sauce = Ingredient.create(name: 'Sauce', calories: 75)
    @chicken = Ingredient.create(name: 'Chicken', calories: 150)
    DishIngredient.create(dish_id: @dish1.id, ingredient_id: @pepperoni.id)
    DishIngredient.create(dish_id: @dish1.id, ingredient_id: @cheese.id)
    DishIngredient.create(dish_id: @dish1.id, ingredient_id: @dough.id)
    DishIngredient.create(dish_id: @dish1.id, ingredient_id: @sauce.id)
    visit dish_path(@dish1)
  end

  describe 'As a visitor' do
    it 'I see the dish name and description' do 
      expect(page).to have_content(@dish1.name)
      expect(page).to have_content(@dish1.description)
    end

    it 'displays a list of ingredients for the dish' do
      expect(page).to have_content('Ingredients')

      within('.ingredients') do
        expect(page).to have_content('Pepperoni')
        expect(page).to have_content('Cheese')
        expect(page).to have_content('Dough')
        expect(page).to have_content('Sauce')
        expect(page).to_not have_content('Chicken')
      end
    end

    it 'displays the total calorie count for the dish' do
      save_and_open_page
      within('.calories') do
        expect(page).to have_content('Total Calories: 425')
      end
    end

    describe 'add an ingredient to the dish' do
      it 'displays a form to add an ingredient' do
        expect(page).to have_content('Add an Ingredient to this Dish')

        within('.add-ingredient') do
          expect(page).to have_field('ID')

          within('.ingredients') do
            expect(page).to_not have_content('Chicken')
          end

          fill_in 'ID', with: @chicken.id
          expect(page).to have_content(@chicken.name)

          expect(page).to have_button('Submit')

          click_button 'Submit'

          within('.ingredients') do
            expect(page).to have_content('Chicken')
          end
        end
      end
    end
  end
end