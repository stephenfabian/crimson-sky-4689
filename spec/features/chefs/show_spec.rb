require 'rails_helper'

RSpec.describe 'Chef Show Page Feature' do
  describe 'When I visit a chefs show page' do
    describe 'I see the name of that chef' do
      describe 'And I see a link to view a list of all ingredients that this chef uses in their dishes' do
        describe 'When I click on that link Im taken to a chefs ingredient index page' do
          it 'and I can see a unique list of names of all the ingredients that this chef uses' do

            chef1 = Chef.create(name: "Roger")
            chef2 = Chef.create(name: "Ethan")

            dish1 = chef1.dishes.create(name: "Pudding", description: "Terrible dessert")
            dish2 = chef1.dishes.create(name: "Chips", description: "snack")
            dish3 = chef2.dishes.create(name: "Pizza", description: "large za")

            ingredient1 = dish1.ingredients.create(name: "Fat", calories: 9000)
            ingredient2 = dish1.ingredients.create(name: "Milk", calories: 500)
            ingredient3 = dish3.ingredients.create(name: "Pizza sauce", calories: 62)
            ingredient4 = dish2.ingredients.create(name: "Fat", calories: 9000)

            visit "/chefs/#{chef1.id}"

            expect(page).to have_content(chef1.name)

            click_link("View Ingredients")

            expect(current_path).to eq("/chefs/#{chef1.id}/ingredients")
            expect(current_path).to eq(chef_ingredients_path(chef1))
            expect(page).to have_content(ingredient1.name, count: 1)
            expect(page).to have_content(ingredient2.name)
            expect(page).to_not have_content(ingredient3.name)
          end
        end
      end
    end
  end
end
