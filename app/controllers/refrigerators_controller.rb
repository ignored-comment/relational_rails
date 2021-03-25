class RefrigeratorsController < ApplicationController
  def index
    @refrigerators = Refrigerator.all
    @refrigerator_order = Refrigerator.order(:created_at)
  end

  def show
    @refrigerator = Refrigerator.find(params[:id])
  end

  def children
    @children = Refrigerator.find(params[:id]).foods
  end
end
