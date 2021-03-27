class RefrigeratorsController < ApplicationController
  def index
    @refrigerators = Refrigerator.all
    @refrigerator_order = Refrigerator.order(:created_at)
  end

  def show
    @refrigerator = Refrigerator.find(params[:id])
    @food_count = @refrigerator.count_foods
  end

  def index_foods_in_refrigerator
    @foods = Refrigerator.find(params[:id]).foods
  end
end
