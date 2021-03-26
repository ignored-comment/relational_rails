class GaragesController < ApplicationController
  def index
    @garages = Garage.all
    @garage_order = Garage.order(:created_at)
  end

  def show
    @garage = Garage.find(params[:id])
  end

  def children
    @children = Garage.find(params[:id]).motorcycles
  end
end
