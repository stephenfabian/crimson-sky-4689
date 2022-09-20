require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end

  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many(:ingredient_dishes)}
    it {should have_many(:ingredients).through(:ingredient_dishes)}
  end

  describe '.total_calories' do
    it 'returns total numbe of calories for that dish' do
      chef1 = Chef.create(name: "Roger")

      dish1 = chef1.dishes.create(name: "Pudding", description: "Terrible dessert")
      dish2 = chef1.dishes.create(name: "Chips", description: "snack")

      ingredient1 = dish1.ingredients.create(name: "Fat", calories: 9000)
      ingredient2 = dish1.ingredients.create(name: "Milk", calories: 500)

      expect(dish1.total_calories).to eq(9500)
    end
  end
end