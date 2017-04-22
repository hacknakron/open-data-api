class API::BaseController < ActionController::API
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
end
