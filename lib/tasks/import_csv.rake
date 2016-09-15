task :import_wards_data => :environment do
  file_importer = FileImporter.new("#{Rails.root}/app/data", "2012wards.csv")
  file_importer.execute
end
