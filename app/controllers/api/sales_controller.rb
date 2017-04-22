class API::SalesController < API::BaseController
  def index
    if params[:parcel_id]
      objects = ParcelSale.where(parid: params[:parcel_id]).order(:sales_date)
    else
      objects = ParcelSale.order(:parcel_id, :sales_date)
    end

    render json: create_index_data(objects)
  end

  def show
    render json: ParcelSale.find_by(object_id: params[:id])
  end
end
