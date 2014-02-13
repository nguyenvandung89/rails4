class Admin::GearboxesController < AdminsController

  before_filter :load_object, only: [:show, :edit, :update, :destroy]

  def index
    @gearboxes = Gearbox.all.page params[:page]
  end

  def show
  end

  def new
    @gearbox = Gearbox.new
  end

  def edit
  end

  def create
    @gearbox = Gearbox.new gearbox_params
    if @gearbox.save
      redirect_to admin_gearbox_path(@gearbox), notice: {:".created" => {gearbox_type: @gearbox.gearbox_type}}
    else
      render :new
    end
  end

  def update
    if @gearbox.update(gearbox_params)
      redirect_to admin_gearbox_path(@gearbox), notice: {:".updated" => {gearbox_type: @gearbox.gearbox_type}}
    else
      render :edit
    end
  end

  def destroy
    @gearbox.destroy
    redirect_to admin_gearboxes_path,
      notice: {:".destroyed" => {gearbox_type: @gearbox.gearbox_type}}
  end

  private
  def load_object
    @gearbox = Gearbox.find params[:id]
  end

  def gearbox_params
    params.require(:gearbox).permit Gearbox::PERMITTED_PARAMS
  end
end
