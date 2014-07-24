class Admin::CarsController < AdminsController

  before_filter :load_object, only: [:show, :edit, :update, :destroy]

  def index
    @cars = Car.all.page params[:page]
  end

  def show
  end

  def new
    @car = Car.new
  end

  def edit
  end

  def create
    @car = Car.new car_params
    if @car.save
      redirect_to admin_car_path(@car), notice: :".created"
    else
      render :new
    end
  end

  def update
    if @car.update(car_params)
      respond_to do |format|
        format.js
        format.html {redirect_to :back}
      end
      # redirect_to admin_car_path(@car), notice: :".updated"
    else
      render :edit
    end
  end

  def destroy
    @car.destroy
    redirect_to admin_cars_path,  notice: :".destroyed"
  end

  private
  def load_object
    @car = Car.find params[:id]
  end

  def car_params
    params.require(:car).permit Car::PERMITTED_PARAMS
  end
end
