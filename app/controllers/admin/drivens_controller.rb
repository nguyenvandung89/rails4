class Admin::DrivensController < AdminsController

  before_filter :load_object, only: [:show, :edit, :update, :destroy]

  def index
    @drivens = Driven.all.page params[:page]
  end

  def show
  end

  def new
    @driven = Driven.new
  end

  def edit
  end

  def create
    @driven = Driven.new driven_params
    if @driven.save
      redirect_to admin_driven_path(@driven), notice: {:".created" => {driven_type: @driven.driven_type}}
    else
      render :new
    end
  end

  def update
    if @driven.update(driven_params)
      redirect_to admin_driven_path(@driven), notice: {:".updated" => {driven_type: @driven.driven_type}}
    else
      render :edit
    end
  end

  def destroy
    @driven.destroy
    redirect_to admin_drivenes_path,
      notice: {:".destroyed" => {driven_type: @driven.driven_type}}
  end

  private
  def load_object
    @driven = Driven.find params[:id]
  end

  def driven_params
    params.require(:driven).permit Driven::PERMITTED_PARAMS
  end
end
