require 'csv'
require 'active_record'
require 'date'

ENV['pg_host'] ||= 'localhost'
ENV['pg_port'] ||= '5432'
ENV['pg_database'] ||= 'open-data-api_development'
ENV['pg_username'] ||= 'postgres'
ENV['pg_password'] ||= ''

class FileImporter
    attr_reader :csv, :file, :path, :name

    def initialize(file_path, file_name)
        begin
            @path = file_path
            @name = file_name
            @file = File.new("#{@path}/#{@name}")
            @csv = CSV.parse(@file.read, headers: true)
        rescue
        end
    end

    def execute
        begin
            connect_to_database
            create_raw_table
            insert_data
            ActiveRecord::Base.connection.close
        ensure
            ActiveRecord::Base.connection.close if ActiveRecord::Base.connection
            ActiveRecord::Base.clear_active_connections!
        end
    end

private
    def connect_to_database
        ActiveRecord::Base.establish_connection(
            adapter:    'postgresql',
            host:       ENV['pg_host'],
            port:       ENV['pg_port'],
            database:   ENV['pg_database'],
            username:   ENV['pg_username'],
            password:   ENV['pg_password']
        )
    end

    def create_raw_table
        puts "CREATING TABLE NAME: '#{raw_table_name}'"
        puts "--------------------------------------------------"
        @current_table_name = raw_table_name
        ActiveRecord::Migration.create_table(@current_table_name.to_sym) do |t|
            @csv.headers.each do |column_name|
                t.column column_name.to_sym, :string, limit: 300
            end
        end
        puts "--------------------------------------------------"
    end

    def insert_data
        puts "INSERTING DATA"
        puts "--------------------------------------------------"
        @csv.each do |csv_row|
            add_csv_row_to_table(csv_row)
        end
        puts "--------------------------------------------------"
    end

    def add_csv_row_to_table(csv_row)
        ActiveRecord::Base.connection.execute insert_statement_from_csv_row(csv_row)
    end

    def insert_statement_from_csv_row(csv_row)
        values = "DEFAULT"
        csv_row.each { |col| col[1] ? values += ",'#{col[1]}'" : values += ",null" }
        "INSERT INTO #{@current_table_name} VALUES (#{values});"
    end

    def escape_psql_characters(value)
        chars = [' ', ',']
        chars.each { |c| value = value.gsub(c, "\\#{c}")}
        value
    end

    def raw_table_name
        "_raw_#{@name.gsub('.csv', '')}"
    end

    def raw_table_name_with_time
        "_raw_#{@name.gsub('.csv', '')}_#{DateTime.now.to_i}"
    end
end
