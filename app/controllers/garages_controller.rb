class GaragesController < ApplicationController
  def index
    @garages = Garage.all
    @garage_order = Garage.order(:created_at)
  end

  def show
    @garage = Garage.find(params[:id])
    @motorcycle_count = @garage.count_motorcycles
  end

  def index_motorcycles_in_garage
    @motorcycles = Garage.find(params[:id]).motorcycles
  end

  def new

  end

  def create
    garage = Garage.new({
      name: params[:garage][:name],
      at_capacity: params[:garage][:at_capacity],
      max_capacity: params[:garage][:max_capacity]
      })
    garage.save

    redirect_to '/garages'
  end

  def edit
    @garage = Garage.find(params[:id])
  end

  def update
    garage = Garage.find(params[:id])
    garage.update({
      name: params[:garage][:name],
      at_capacity: params[:garage][:at_capacity],
      max_capacity: params[:garage][:max_capacity]
      })
    garage.save
    redirect_to "/garages/#{garage.id}"
  end
end
