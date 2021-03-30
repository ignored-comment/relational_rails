class MotorcyclesController < ApplicationController

  def index
    @motorcycles = Motorcycle.all
  end

  def show
    @motorcycle = Motorcycle.find(params[:id])
  end

  def new
    @garage = Garage.find(params[:id])
  end

  def create
    @garage = Garage.find(params[:id])
    @garage.motorcycles.create!(
      name: params[:name],
      ride_ready: params[:ride_ready],
      model_year: params[:model_year]
      # refrigerator_id: params[:refrigerator_id]
    )
    redirect_to "/garages/#{@garage.id}/motorcycles"
  end
end
