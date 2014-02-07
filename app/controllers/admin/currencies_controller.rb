class Admin::CurrenciesController < ApplicationController

  before_filter :load_object, only: [:show, :edit, :update, :destroy]

  def index
    @currencys = Currency.all.page params[:page]
  end

  def show
  end

  def new
    @currency = Currency.new
  end

  def edit
  end

  def create
    @currency = Currency.new currency_params
    if @currency.save
      redirect_to admin_currency_path(@currency), notice: {:".created" => {name: @currency.name}}
    else
      render :new
    end
  end

  def update
    if @currency.update(currency_params)
      redirect_to admin_currency_path(@currency), notice: {:".updated" => {name: @currency.name}}
    else
      render :edit
    end
  end

  def destroy
    @currency.destroy
    redirect_to admin_currencies_path,
      notice: {:".destroyed" => {name: @currency.name}}
  end

  private
  def load_object
    @currency = Currency.find params[:id]
  end

  def currency_params
    params.require(:currency).permit Currency::PERMITTED_PARAMS
  end
end
