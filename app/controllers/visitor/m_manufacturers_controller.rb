class Visitor::MManufacturersController < ApplicationController
  layout "car"
  def show
    @m_manufacturer = M::Manufacturer.find params[:id]
  end
end