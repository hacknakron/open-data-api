class RefreshController < ApplicationController
  def index
    if params[:get_data] == true
      # Call Nick's thing
    end

    execute_query = ExecuteRawSql.new
    binding.pry
    execute_query.query(params[:_action], params[:csv_file_name])

    redirect_to refresh_result_index_url
  end
end
