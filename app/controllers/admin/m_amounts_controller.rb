class Admin::MAmountsController < ApplicationController

  before_filter :load_object, only: [:show, :edit, :update, :destroy]

  def index
    @m_amounts = M::Amount.all.page params[:page]
  end

  def show
  end

  def new
    @m_amount = M::Amount.new
  end

  def edit
  end

  def create
    @m_amount = M::Amount.new m_amount_params
    if @m_amount.save
      redirect_to admin_m_amount_path(@m_amount), notice: {:".created" => {amount: @m_amount.amount}}
    else
      render :new
    end
  end

  def update
    if @m_amount.update(m_amount_params)
      redirect_to admin_m_amount_path(@m_amount), notice: {:".updated" => {amount: @m_amount.amount}}
    else
      render :edit
    end
  end

  def destroy
    @m_amount.destroy
    redirect_to admin_m_amounts_path,
      notice: {:".destroyed" => {amount: @m_amount.amount}}
  end

  private
  def load_object
    @m_amount = M::Amount.find params[:id]
  end

  def m_amount_params
    params.require(:m_amount).permit M::Amount::PERMITTED_PARAMS
  end
end
