namespace :data do
  SEED_DIR_PATH = "db/seed/".freeze

  namespace :generate do
    desc "Generate local seed files from the FTP server"
    task :seed_files => :environment do
      DataImporter::IMPORT_ORDER.each do |file|
        filename = "#{file}.csv"
        csv_data = COAFTPConnection.with_connection { |ftp| ftp.getbinaryfile(filename, nil, 1024) }

        subset_data = CSV.new(csv_data, :header_converters => :symbol).to_a[0..1000]

        CSV.open(SEED_DIR_PATH+filename, "wb") { |csv| subset_data.each { |row| csv << row } }
      end
    end
  end

  namespace :import do
    desc "Import the local seed files"
    task :seed_files => :environment do
      DataImporter::IMPORT_ORDER.each do |file_type|
        puts "Importing #{file_type}"

        klass = DataImporter::FILE_IMPORTERS[file_type]
        file_data = File.read(SEED_DIR_PATH+"#{file_type}.csv")

        klass.new(file_data).import!
      end
    end
  end
end