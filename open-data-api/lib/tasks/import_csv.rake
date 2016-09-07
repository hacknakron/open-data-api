require "#{Rails.root}/app/services/file_importer.rb"

task :import_ward_data do
  file_importer = FileImporter.new
  csv_file = file_importer.import_file('GIS/Hackathon/', '2012Wards.csv')

  puts csv_file
end
