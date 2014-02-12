class Visitor::CarsController < VisitorsController
  layout "car"
  def show
    @car = Car.find params[:id]
  end
end