class AddRefreshResults < ActiveRecord::Migration[5.0]
  def up
    sql = <<-SQL

    CREATE TABLE IF NOT EXISTS refresh_results (
      id integer,
      action VARCHAR,
      csv_file VARCHAR,
      record_count INT,
      url VARCHAR,
      PRIMARY KEY (id)
    );

    INSERT INTO refresh_results
      VALUES (1,'GET','2012wards',10, 'http//:localhost:3000/_raw_2012wards')
      ,(2,'VALIDATE','2012wards',2, 'http//:localhost:3000/view_akron_wards_errors')
      ,(3,'IMPORT','2012wards',8, 'http//:localhost:3000/view_akron_wards')
    ;

    SQL

    execute sql
  end

  def down
    sql = <<-SQL
      DROP TABLE refresh_results
    SQL

    execute sql
  end
end

