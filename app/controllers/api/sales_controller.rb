class API::SalesController < API::BaseController
  def index
    if params[:parcel_id]
      objects = ParcelSale.where(parid: params[:parcel_id]).order(:sales_date)
    else
      objects = ParcelSale.order(:parcel_id, :sales_date)
    end

    response_object = paginated_response(objects)
    if stale?(response_object['data'])
      render json: response_object
    end
  end

  def show
    parcel_sale = ParcelSale.find_by!(object_id: params[:id])

    if stale?(parcel_sale)
      render json: { data: parcel_sale }
    end
  end
end
