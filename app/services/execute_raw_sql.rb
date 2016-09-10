class ExecuteRawSql
  include ActiveRecord::ConnectionAdapters::Quoting

  def query(action, csv_file_name)
    results = ActiveRecord::Base.connection.exec_query "SELECT data_controller['#{action}', #{csv_file_name}]"
  end
end
