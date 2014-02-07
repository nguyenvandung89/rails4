class Admin::ExteriorsController < ApplicationController

  before_filter :load_object, only: [:show, :edit, :update, :destroy]

  def index
    @q = Exterior.search params[:q]
    @exteriors = @q.result.page params[:page]
  end

  def show
  end

  def new
    @exterior = Exterior.new
  end

  def edit
  end

  def create
    @exterior = Exterior.new exterior_params
    if @exterior.save
      redirect_to admin_exterior_path(@exterior), notice: {:".created" => {color: @exterior.color}}
    else
      render :new
    end
  end

  def update
    if @exterior.update(exterior_params)
      redirect_to admin_exterior_path(@exterior), notice: {:".updated" => {color: @exterior.color}}
    else
      render :edit
    end
  end

  def destroy
    @exterior.destroy
    redirect_to admin_exteriors_path,
      notice: {:".destroyed" => {color: @exterior.color}}
  end

  private
  def load_object
    @exterior = Exterior.find params[:id]
  end

  def exterior_params
    params.require(:exterior).permit Exterior::PERMITTED_PARAMS
  end
end
