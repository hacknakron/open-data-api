task :import_clc_data => :environment do
  file_importer = FileImporter.new
  file_importer.import_file("#{Rails.root}/app/data/CLC Information.csv")
end
