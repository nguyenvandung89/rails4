class Admin::InteriorsController < ApplicationController

  before_filter :load_object, only: [:show, :edit, :update, :destroy]

  def index
    @interiors = Interior.all.page params[:page]
  end

  def show
  end

  def new
    @interior = Interior.new
  end

  def edit
  end

  def create
    @interior = Interior.new interior_params
    if @interior.save
      redirect_to admin_interior_path(@interior), notice: {:".created" => {color: @interior.color}}
    else
      render :new
    end
  end

  def update
    if @interior.update(interior_params)
      redirect_to admin_interior_path(@interior), notice: {:".updated" => {color: @interior.color}}
    else
      render :edit
    end
  end

  def destroy
    @interior.destroy
    redirect_to admin_interiors_path,
      notice: {:".destroyed" => {color: @interior.color}}
  end

  private
  def load_object
    @interior = Interior.find params[:id]
  end

  def interior_params
    params.require(:interior).permit Interior::PERMITTED_PARAMS
  end
end
