class API::ParcelsController < API::BaseController
  def index
    response_object = paginated_response(Parcel.order(:id).where(filter_params))

    if stale?(response_object['data'])
      render json: response_object
    end
  end

  def show
    parcel = Parcel.find_by!(parcel_id: params[:id])

    if stale?(parcel)
      render json: { data: parcel }
    end
  end

  private

    def filter_params
      params.fetch('filters', {}).permit(
        'object_id' => [],
        'tax_year' => [],
        'use_class' => [],
        'use_code' => [],
      )
    end
end
