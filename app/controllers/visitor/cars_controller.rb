class Visitor::CarsController < ApplicationController
  layout "car"
  def show
    @car = Car.find params[:id]
  end
end