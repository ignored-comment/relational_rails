class RefrigeratorsController < ApplicationController
  def index
    @refrigerators = Refrigerator.all
  end

  def show
    @refrigerator = Refrigerator.find(params[:id])
  end
end
