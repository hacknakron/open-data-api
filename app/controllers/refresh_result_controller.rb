class RefreshResultController < ApplicationController
  def index
    render json: RefreshResult.all
  end
end
