class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception

  def headers_for_downloading_csv(filename = params[:controller])
    response.headers["Content-Type"] = "text/csv"
    response.headers["Content-Disposition"] = "attachment;" +
      "filename=#{filename}.csv"
  end
end
