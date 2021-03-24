class GaragesController < ApplicationController
  def index
    @garages = Garage.all
  end

  def show
    @garage = Garage.find(params[:id])
  end

  def children
    @children = Garage.find(params[:id]).motorcycle
  end
end
