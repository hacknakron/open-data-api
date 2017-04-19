desc "Import the latest data from the FTP server"
task :import_data => :environment do
  DataImporter.new.import_all
end
