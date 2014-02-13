class Admin::PostBuyCarsController < AdminsController

  before_filter :load_object, only: [:show, :edit, :update, :destroy]

  def index
    @post_buy_cars = PostBuyCar.all.page params[:page]
  end

  def show
  end

  def new
    @post_buy_car = PostBuyCar.new
  end

  def edit
  end

  def create
    @post_buy_car = PostBuyCar.new post_buy_car_params
    if @post_buy_car.save
      redirect_to admin_post_buy_car_path(@post_buy_car), notice: {:".created" => {title: @post_buy_car.title}}
    else
      render :new
    end
  end

  def update
    if @post_buy_car.update(post_buy_car_params)
      redirect_to admin_post_buy_car_path(@post_buy_car), notice: {:".updated" => {title: @post_buy_car.title}}
    else
      render :edit
    end
  end

  def destroy
    @post_buy_car.destroy
    redirect_to admin_post_buy_cars_path,
      notice: {:".destroyed" => {title: @post_buy_car.title}}
  end

  private
  def load_object
    @post_buy_car = PostBuyCar.find params[:id]
  end

  def post_buy_car_params
    params.require(:post_buy_car).permit PostBuyCar::PERMITTED_PARAMS
  end
end
