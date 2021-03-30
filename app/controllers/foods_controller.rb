class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def show
    @food = Food.find(params[:id])
  end

  def new
    @refrigerator = Refrigerator.find(params[:id])
  end

  def create
    @food = Food.create!(
      name: params[:name],
      expired: params[:expired],
      total_items_available: params[:total_items_available],
      refrigerator_id: params[:refrigerator_id]
    )
    redirect_to "/refrigerators/:id/foods"
  end
end