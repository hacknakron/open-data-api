desc "Import the latest data from the FTP server"
task :import_data => :environment do
  DataImportJob.perform_later
end
