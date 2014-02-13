class Admin::SalonCarsController < AdminsController

  before_filter :load_object, only: [:show, :edit, :update, :destroy]

  def index
    @salon_cars = SalonCar.all.page params[:page]
  end

  def show
  end

  def new
    @salon_car = SalonCar.new
  end

  def edit
  end

  def create
    @salon_car = SalonCar.new salon_car_params
    if @salon_car.save
      redirect_to admin_salon_car_path(@salon_car), notice: {:".created" => {name: @salon_car.name}}
    else
      render :new
    end
  end

  def update
    if @salon_car.update(salon_car_params)
      redirect_to admin_salon_car_path(@salon_car), notice: {:".updated" => {name: @salon_car.name}}
    else
      render :edit
    end
  end

  def destroy
    @salon_car.destroy
    redirect_to admin_salon_cars_path,
      notice: {:".destroyed" => {name: @salon_car.name}}
  end

  private
  def load_object
    @salon_car = SalonCar.find params[:id]
  end

  def salon_car_params
    params.require(:salon_car).permit SalonCar::PERMITTED_PARAMS
  end
end
