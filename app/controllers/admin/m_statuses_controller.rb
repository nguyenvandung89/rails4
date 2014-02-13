class Admin::MStatusesController < AdminsController

  before_filter :load_object, only: [:show, :edit, :update, :destroy]

  def index
    @m_statuses = M::Status.all.page params[:page]
  end

  def show
  end

  def new
    @m_status = M::Status.new
  end

  def edit
  end

  def create
    @m_status = M::Status.new m_status_params
    if @m_status.save
      redirect_to admin_m_status_path(@m_status), notice: {:".created" => {status: @m_status.status}}
    else
      render :new
    end
  end

  def update
    if @m_status.update(m_status_params)
      redirect_to admin_m_status_path(@m_status), notice: {:".updated" => {status: @m_status.status}}
    else
      render :edit
    end
  end

  def destroy
    @m_status.destroy
    redirect_to admin_m_statuses_path,
      notice: {:".destroyed" => {status: @m_status.status}}
  end

  private
  def load_object
    @m_status = M::Status.find params[:id]
  end

  def m_status_params
    params.require(:m_status).permit M::Status::PERMITTED_PARAMS
  end
end
