class Admin::InstructionBootsController < ApplicationController

  before_filter :load_object, only: [:show, :edit, :update, :destroy]

  def index
    @instruction_boots = InstructionBoot.all.page params[:page]
  end

  def show
  end

  def new
    @instruction_boot = InstructionBoot.new
  end

  def edit
  end

  def create
    @instruction_boot = InstructionBoot.new instruction_boot_params
    if @instruction_boot.save
      redirect_to admin_instruction_boot_path(@instruction_boot), notice: {:".created" => {name: @instruction_boot.name}}
    else
      render :new
    end
  end

  def update
    if @instruction_boot.update(instruction_boot_params)
      redirect_to admin_instruction_boot_path(@instruction_boot), notice: {:".updated" => {name: @instruction_boot.name}}
    else
      render :edit
    end
  end

  def destroy
    @instruction_boot.destroy
    redirect_to admin_instruction_boots_path,
      notice: {:".destroyed" => {name: @instruction_boot.name}}
  end

  private
  def load_object
    @instruction_boot = InstructionBoot.find params[:id]
  end

  def instruction_boot_params
    params.require(:instruction_boot).permit InstructionBoot::PERMITTED_PARAMS
  end
end
