class API::BaseController < ActionController::API

  rescue_from ::ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ::Exception, with: :error_occurred

  protected

	def create_index_data objects
		objects = objects.page(params[:page]).per(params[:per_page])
		{
	      data: objects,
	      meta: {
	      	count: objects.total_count,
	      	pages: objects.total_pages
	      }
	 	}
	end

    def error_occurred(exception)
      render json: { error: exception.message }.to_json, status: 500
      return
    end

    def record_not_found(exception)
      render json: { error: exception.message }.to_json, status: 404
      return
    end
end
