class ViewAkronWardController < ActionController::API
  def index
    render json: ViewAkronWard.all
  end
end
