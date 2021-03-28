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

  def new
  end

  def create
    refrigerator = Refrigerator.new({
      name: params[:refrigerator][:name],
      has_freezer: params[:refrigerator][:has_freezer],
      capacity_cubic_feet: params[:refrigerator][:capacity_cubic_feet]
      })
    refrigerator.save

    redirect_to '/refrigerators'
  end

  def edit
    @refrigerator = Refrigerator.find(params[:id])
  end

  def update
    refrigerator = Refrigerator.find(params[:id])
    refrigerator.update({
      name: params[:refrigerator][:name],
      has_freezer: params[:refrigerator][:has_freezer],
      capacity_cubic_feet: params[:refrigerator][:capacity_cubic_feet]
      })
    refrigerator.save
    redirect_to "/refrigerators/#{refrigerator.id}"
  end
end
