class API::ParcelsController < API::BaseController
  def index
    render json: Parcel.order(:id).page(params[:page]).per(params[:per_page])
  end

  def show
    render json: Parcel.find_by(parcel_id: params[:id])
  end
end
