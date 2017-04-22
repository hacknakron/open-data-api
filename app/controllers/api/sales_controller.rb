class API::SalesController < API::BaseController
  def index
    render json: ParcelSale.order(:parcel_id, :sales_date).page(params[:page]).per(params[:per_page])
  end

  def show
    render json: ParcelSale.where(parcel_id: params[:id]).order(:sales_date)
  end
end
