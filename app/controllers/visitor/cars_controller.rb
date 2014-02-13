class Visitor::CarsController < VisitorsController
  layout "car"
  before_filter :load_object, only: [:show, :edit, :update, :destroy]

  def index
    @cars = Car.all.page params[:page]
  end

  def show
  end

  def new
    @car = current_visitor.cars.build
  end

  def edit
  end

  def create
    @car = current_visitor.cars.build car_params
    if @car.save
      redirect_to car_path(@car)
      flash[:notice] = "Created success"
    else
      render :new
    end
  end

  def update
    if @car.update(car_params)
      redirect_to car_path(@car)
      flash[:notice] = "Updated success"
    else
      render :edit
    end
  end

  def destroy
    @car.destroy
    redirect_to root_path,  notice: :".destroyed"
  end

  private
  def load_object
    @car = Car.find params[:id]
  end

  def car_params
    params.require(:car).permit Car::PERMITTED_PARAMS
  end
end