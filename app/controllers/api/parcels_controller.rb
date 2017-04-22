class API::ParcelsController < API::BaseController
  def index
    render json: paginated_response(Parcel.order(:id).where(filter_params))
  end

  def show
    render json: {
      data: Parcel.find_by!(parcel_id: params[:id])
    }
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
