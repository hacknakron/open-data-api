class ExecuteRawSql
  include ActiveRecord::ConnectionAdapters::Quoting

  def query(_action, csv_file_name)
    binding.pry
    results = ActiveRecord::Base.connection.exec_query "SELECT data_controller('#{_action}', '#{csv_file_name}')"
  end
end
