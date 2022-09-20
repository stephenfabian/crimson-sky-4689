require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end

  describe 'chef_ingredients' do
    it 'returns an array of unique ingredients from that chefs dishes' do
      chef1 = Chef.create(name: "Roger")
      chef2 = Chef.create(name: "Ethan")

      dish1 = chef1.dishes.create(name: "Pudding", description: "Terrible dessert")
      dish2 = chef1.dishes.create(name: "Chips", description: "snack")
      dish3 = chef2.dishes.create(name: "Pizza", description: "large za")

      ingredient1 = dish1.ingredients.create(name: "Fat", calories: 9000)
      ingredient2 = dish1.ingredients.create(name: "Milk", calories: 500)
      ingredient3 = dish3.ingredients.create(name: "Pizza sauce", calories: 62)
      ingredient4 = dish2.ingredients.create(name: "Fat", calories: 9000)

      expect(chef1.chef_ingredients).to eq(["Fat", "Milk"])
    end
  end
end