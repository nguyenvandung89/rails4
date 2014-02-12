class Visitor::MManufacturersController < VisitorsController
  layout "car"

  def index
    @driven = Driven.find params[:target]
  end

  def show
    @m_manufacturer = M::Manufacturer.find params[:id]
  end
end