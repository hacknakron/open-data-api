class ViewAkronWardController < ActionController::API
  def index
    execute_query = ExecuteRawSql.new
    execute_query.query('test', 'test')
    render json: ViewAkronWard.all
  end

  def find_by
    render json: ViewAkronWard.where(find_params)
  end

  def find_where
    column   = params[:column]
    operator = params[:operator] || ''
    value    = params[:value]

    case operator
    when 'less_than'
      query_string = column << ' < ?'
    when 'less_than_or_equal_to'
      query_string = column << ' <= ?'
    when 'greater_than'
      query_string = column << ' > ?'
    when 'greater_than_or_equal_to'
      query_string = column << ' >= ?'
    end

    if find_where_columns_present?
      if column_type(column) == :integer
        render json: ViewAkronWard.where(query_string, value.to_i)
      else
        render json: ViewAkronWard.where(query_string, value)
      end
    else
      render html: "Improper Query!"
    end
  end

  private

  def column_type(column)

    column_type = ''

    ViewAkronWard.columns.each do |obj|
      if obj.name == column
        column_type = obj.sql_type_metadata.type
      end
    end

    column_type
  end

  def find_where_columns_present?
    params[:column] && params[:operator] && params[:value]
  end

  def find_params
    params.permit(:wardnumber,
                  :wardname,
                  :wardobjectid,
                  :wardcode,
                  :totalpopulation,
                  :deviationfromaverage,
                  :deviationfromaveragepercent,
                  :whitepopulation,
                  :whitepopulationpercent,
                  :blackpopulation,
                  :blackpopulationpercent,
                  :hispanicpopulation,
                  :hispanicpopulationpercent,
                  :councilperson,
                  :councilpersonweblink,
                  :wardglobalid,
                  :wardshape_starea,
                  :wardshape_stlength,
                  :operator)
  end
end
