task :import_ward_data => :environment do
  file_importer = FileImporter.new
  file_importer.import_file("City_Data/2016/Q3/", "2012Wards.csv")
