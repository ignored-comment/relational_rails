class FoodsController < ApplicationController
  def index
    @foods = Food.expired
  end

  def show
    @food = Food.find(params[:id])
  end

  def new
    @refrigerator = Refrigerator.find(params[:id])
  end

  def create
    @refrigerator = Refrigerator.find(params[:id])
    @refrigerator.foods.create!(
      name: params[:name],
      expired: params[:expired],
      total_items_available: params[:total_items_available],
      refrigerator_id: params[:refrigerator_id]
    )
    redirect_to "/refrigerators/#{@refrigerator.id}/foods"
  end

  def edit
    @food = Food.find(params[:id])
  end

  def update
    food = Food.find(params[:id])
    food.update(
      name: params[:name],
      expired: params[:expired],
      total_items_available: params[:total_items_available]
      )
    food.save
    redirect_to "/foods/#{food.id}"
  end
end