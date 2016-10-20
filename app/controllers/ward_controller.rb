class WardController < ApplicationController
  def index
    @wards = Ward.all

    render json: @wards
  end
end
