class IngredientsController < ApplicationController

  def index
    @chef = Chef.find(params[:chef_id])
    @chef_ingredients = @chef.chef_ingredients
  end
end