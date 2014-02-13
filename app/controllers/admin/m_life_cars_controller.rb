class Admin::MLifeCarsController < AdminsController

  before_filter :load_object, only: [:show, :edit, :update, :destroy]

  def index
    @m_life_cars = M::LifeCar.all.page params[:page]
  end

  def show
  end

  def new
    @m_life_car = M::LifeCar.new
  end

  def edit
  end

  def create
    @m_life_car = M::LifeCar.new m_life_car_params
    if @m_life_car.save
      redirect_to admin_m_life_car_path(@m_life_car), notice: {:".created" => {name: @m_life_car.name}}
    else
      render :new
    end
  end

  def update
    if @m_life_car.update(m_life_car_params)
      redirect_to admin_m_life_car_path(@m_life_car), notice: {:".updated" => {name: @m_life_car.name}}
    else
      render :edit
    end
  end

  def destroy
    @m_life_car.destroy
    redirect_to admin_m_life_cars_path,
      notice: {:".destroyed" => {name: @m_life_car.name}}
  end

  private
  def load_object
    @m_life_car = M::LifeCar.find params[:id]
  end

  def m_life_car_params
    params.require(:m_life_car).permit M::LifeCar::PERMITTED_PARAMS
  end
end
