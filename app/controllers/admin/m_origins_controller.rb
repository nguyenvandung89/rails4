class Admin::MOriginsController < ApplicationController

  before_filter :load_object, only: [:show, :edit, :update, :destroy]

  def index
    @m_origins = M::Origin.all.page params[:page]
  end

  def show
  end

  def new
    @m_origin = M::Origin.new
  end

  def edit
  end

  def create
    @m_origin = M::Origin.new m_origin_params
    if @m_origin.save
      redirect_to admin_m_origin_path(@m_origin), notice: {:".created" => {name: @m_origin.name}}
    else
      render :new
    end
  end

  def update
    if @m_origin.update(m_origin_params)
      redirect_to admin_m_origin_path(@m_origin), notice: {:".updated" => {name: @m_origin.name}}
    else
      render :edit
    end
  end

  def destroy
    @m_origin.destroy
    redirect_to admin_m_origins_path,
      notice: {:".destroyed" => {name: @m_origin.name}}
  end

  private
  def load_object
    @m_origin = M::Origin.find params[:id]
  end

  def m_origin_params
    params.require(:m_origin).permit M::Origin::PERMITTED_PARAMS
  end
end
