class AddTestProcedure < ActiveRecord::Migration[5.0]
  def up
    sql = <<-SQL

    CREATE OR REPLACE FUNCTION data_controller(action VARCHAR, csv_file_name VARCHAR)
      RETURNS void AS $$
      BEGIN
      CREATE TABLE IF NOT EXISTS data_controller_worked (col1 VARCHAR);
    END;
    $$ LANGUAGE plpgsql;

    SQL

    execute sql
  end

  def down
    sql = <<-SQL
      DROP FUNCTION data_controller
    SQL

    execute sql
  end
end
