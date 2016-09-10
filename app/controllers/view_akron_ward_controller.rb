class ViewAkronWardController < ActionController::API
  def index
    execute_query = ExecuteRawSql.new
    execute_query.query('test', 'test')
    render json: ViewAkronWard.all
  end

  def find_by
    render json: ViewAkronWard.where(find_params)
  end

private

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
                  :wardshape_stlength)
  end
end
