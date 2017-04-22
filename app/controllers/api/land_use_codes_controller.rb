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
    render json: paginated_response(LandUseCode.order(:id).where(filter_params))
  end

  def show
    render json: {
      data: LandUseCode.find_by!(use_code: params[:id])
    }
  end

  private

    def filter_params
      params.fetch('filters', {}).permit(
        'use_class' => [],
        'use_code' => []
      )
    end
end
