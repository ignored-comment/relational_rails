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
    refrigerator = Refrigerator.create(
      name: params[:name],
      has_freezer: params[:has_freezer],
      capacity_cubic_feet: params[:capacity_cubic_feet]
      )
    redirect_to '/refrigerators'
  end

  def edit
    @refrigerator = Refrigerator.find(params[:id])
  end

  def update
    refrigerator = Refrigerator.find(params[:id])
    refrigerator.update(
      name: params[:name],
      has_freezer: params[:has_freezer],
      capacity_cubic_feet: params[:capacity_cubic_feet]
      )
    refrigerator.save
    redirect_to "/refrigerators/#{refrigerator.id}"
  end

  def index_sorted_foods_in_refrigerator
    if params[:total_items_available].nil?
      @foods = Refrigerator.find(params[:id]).foods.order(:name)
    else
      form_argument = params[:total_items_available]
      @foods = Refrigerator.find(params[:id]).foods.where("total_items_available > ?", form_argument)
    end
  end

  def destroy
    Refrigerator.destroy(params[:id])
    redirect_to '/refrigerators'
  end
end
