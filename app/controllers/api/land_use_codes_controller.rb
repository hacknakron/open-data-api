class API::LandUseCodesController < API::BaseController
  def classes
    render json: {
      data: [
       LandUseCode::CLASSES,
      ]
    }
  end

  def index
    response_object = paginated_response(LandUseCode.order(:id).where(filter_params))

    if stale?(response_object['data'])
      render json: response_object
    end
  end

  def show
    land_use_code = LandUseCode.find_by!(use_code: params[:id])

    if stale?(land_use_code)
      render json: { data: land_use_code }
    end
  end

  private

    def filter_params
      params.fetch('filters', {}).permit(
        'use_class' => [],
        'use_code' => []
      )
    end
end
