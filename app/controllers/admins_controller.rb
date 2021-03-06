class AdminsController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :authenticate_user!
  def after_sign_in_path_for(resource)
    admin_cars_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protect_from_forgery with: :exception
end