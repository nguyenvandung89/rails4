class Admin::MManufacturersController < AdminsController
  before_filter :load_object, only: [:show, :edit, :update, :destroy]

  def index
    @m_manufacturers = M::Manufacturer.all.page params[:page]
    respond_to do |format|
      format.html 
      format.csv {headers_for_downloading_csv}
      format.xls
      format.pdf
    end
  end

  def show
  end

  def new
    @m_manufacturer = M::Manufacturer.new
  end

  def edit
  end

  def create
    @m_manufacturer = M::Manufacturer.new m_manufacturer_params
    if @m_manufacturer.save
      redirect_to admin_m_manufacturer_path(@m_manufacturer), notice: {:".created" => {name: @m_manufacturer.name}}
    else
      render :new
    end
  end

  def update
    if @m_manufacturer.update(m_manufacturer_params)
      redirect_to admin_m_manufacturer_path(@m_manufacturer), notice: {:".updated" => {name: @m_manufacturer.name}}
    else
      render :edit
    end
  end

  def destroy
    @m_manufacturer.destroy
    redirect_to admin_m_manufacturers_path,
      notice: {:".destroyed" => {name: @m_manufacturer.name}}
  end

  private
  def load_object
    @m_manufacturer = M::Manufacturer.find params[:id]
  end

  def m_manufacturer_params
    params.require(:m_manufacturer).permit M::Manufacturer::PERMITTED_PARAMS
  end
end
