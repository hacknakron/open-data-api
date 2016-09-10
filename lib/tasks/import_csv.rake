task :import_clc_data => :environment do
  file_importer = FileImporter.new("#{Rails.root}/app/data", "CLC Information.csv")
  file_importer.execute
end
