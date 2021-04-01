class GaragesController < ApplicationController
  def index
    @garage_order = Garage.order(:created_at)
  end

  def show
    @garage = Garage.find(params[:id])
    @motorcycle_count = @garage.count_motorcycles
  end

  def index_motorcycles_in_garage
    @motorcycles = Garage.find(params[:id]).motorcycles
  end

  def index_sorted_motorycles_in_garage
    if params[:model_year].nil?
      @motorcycles = Garage.find(params[:id]).alphabetize
    else
      @motorcycles = Garage.find(params[:id]).new_motorcycles(params[:model_year])
    end
  end

  def new
  end

  def create
    garage = Garage.create(garage_params)
    redirect_to '/garages'
  end

  def edit
    @garage = Garage.find(params[:id])
  end

  def update
    garage = Garage.find(params[:id])
    garage.update(garage_params)
    garage.save
    redirect_to "/garages/#{garage.id}"
  end

  def destroy
    Garage.destroy(params[:id])
    redirect_to '/garages'
  end

  private
  def garage_params
    params.permit(:name, :at_capacity, :max_capacity)
  end
end
