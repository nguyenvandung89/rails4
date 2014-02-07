class Admin::MPrefecturesController < ApplicationController

  before_filter :load_object, only: [:show, :edit, :update, :destroy]

  def index
    @m_prefectures = M::Prefecture.all.page params[:page]
  end

  def show
  end

  def new
    @m_prefecture = M::Prefecture.new
  end

  def edit
  end

  def create
    @m_prefecture = M::Prefecture.new m_prefecture_params
    if @m_prefecture.save
      redirect_to admin_m_prefecture_path(@m_prefecture), notice: {:".created" => {name: @m_prefecture.name}}
    else
      render :new
    end
  end

  def update
    if @m_prefecture.update(m_prefecture_params)
      redirect_to admin_m_prefecture_path(@m_prefecture), notice: {:".updated" => {name: @m_prefecture.name}}
    else
      render :edit
    end
  end

  def destroy
    @m_prefecture.destroy
    redirect_to admin_m_prefectures_path,
      notice: {:".destroyed" => {name: @m_prefecture.name}}
  end

  private
  def load_object
    @m_prefecture = M::Prefecture.find params[:id]
  end

  def m_prefecture_params
    params.require(:m_prefecture).permit M::Prefecture::PERMITTED_PARAMS
  end
end
