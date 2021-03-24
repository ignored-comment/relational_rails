class RefrigeratorsController < ApplicationController
  def index
    @refrigerators = Refrigerator.all
  end
end
