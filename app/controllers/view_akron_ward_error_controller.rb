class ViewAkronWardErrorController < ApplicationController
  def index
    render json: ViewAkronWardError.all
  end
end
