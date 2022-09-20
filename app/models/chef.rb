class Chef < ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def chef_ingredients
    ingredient_name_output = []
    dishes.each do |dish|
      dish.ingredients.each do |ingredient|
       ingredient_name_output << ingredient.name
      end
    end
    ingredient_name_output.uniq
  end
end