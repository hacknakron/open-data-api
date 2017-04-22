class API::LandUseCodesController < API::BaseController
  def classes
    render json: {
      data: [
        { use_class: 'A', name: 'Agriculture' },
        { use_class: 'M', name: 'Mineral Rights' },
        { use_class: 'I', name: 'Industrial' },
        { use_class: 'O', name: 'Oil and Gas' },
        { use_class: 'C', name: 'Commercial' },
        { use_class: 'R', name: 'Residential' },
        { use_class: 'E', name: 'Exempt' },
        { use_class: 'P', name: 'Public Utilities' },
        { use_class: 'G', name: 'Oil and Gas interests' },
        { use_class: 'U', name: 'Railroad' },
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
