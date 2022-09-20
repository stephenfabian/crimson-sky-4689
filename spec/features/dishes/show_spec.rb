require 'rails_helper'

RSpec.describe 'Dishes Show Page Feature' do
  describe 'When I visit a dishs show page' do
    describe 'I see the dishs name and description' do
      describe 'And I see a list of ingredients for that dish' do
        it 'And I see the chefs name' do

          chef1 = Chef.create(name: "Roger")

          dish1 = chef1.dishes.create(name: "Pudding", description: "Terrible dessert")
          dish2 = chef1.dishes.create(name: "Chips", description: "snack")

          ingredient1 = dish1.ingredients.create(name: "Fat", calories: 9000)
          ingredient2 = dish1.ingredients.create(name: "Milk", calories: 500)

          visit "/dishes/#{dish1.id}"
          expect(page).to have_content(dish1.name)
          expect(page).to_not have_content(dish2.name)
          expect(page).to have_content(dish1.description)
          expect(page).to have_content(ingredient1.name)
          expect(page).to have_content(ingredient2.name)
          expect(page).to have_content(chef1.name)
          save_and_open_page
        end
      end
    end
  end


  describe 'When I visit a dishs show page' do
    it 'I see the total calorie count for that dish' do

      chef1 = Chef.create(name: "Roger")

      dish1 = chef1.dishes.create(name: "Pudding", description: "Terrible dessert")
      dish2 = chef1.dishes.create(name: "Chips", description: "snack")

      ingredient1 = dish1.ingredients.create(name: "Fat", calories: 9000)
      ingredient2 = dish1.ingredients.create(name: "Milk", calories: 500)

      visit "/dishes/#{dish1.id}"
      expect(page).to have_content("Total Calories: 9500")
    end
  end
end