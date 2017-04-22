class API::SalesController < API::BaseController
  def index
  	if(params[:parcel_id])
  		render json: ParcelSale.where(parcel_id: params[:parcel_id]).order(:sales_date)
    else
    	render json: ParcelSale.order(:parcel_id, :sales_date).page(params[:page]).per(params[:per_page])
    end
  end

  def show
    render json: ParcelSale.find_by(object_id: params[:id])
  end
end
