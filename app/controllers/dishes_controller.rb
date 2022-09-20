class DishesController < ApplicationController

  def show
    @dish = Dish.find(params[:id])
    @calorie_count = @dish.total_calories
  end
end