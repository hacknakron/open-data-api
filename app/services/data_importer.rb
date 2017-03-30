require 'net/ftp'
require 'csv'

class DataImporter
  IMPORT_ORDER = [:LUCCODES, :CAMAPARDAT, :CAMASALES, :CAMAAPRVAL].freeze
  # IMPORT_ORDER = [:LUCCODES, :CAMAAPRVAL].freeze
  # IMPORT_ORDER = [:CAMASALES].freeze
  FILE_IMPORTERS = {LUCCODES: Importer::LandUseCodes,
                    CAMAPARDAT: Importer::Parcels,
                    CAMASALES: Importer::ParcelSales,
                    CAMAAPRVAL: Importer::ParcelAppraisals}.freeze

  def get_file_data(filename)
    ftp = ftp_connection
    file_data = ftp.getbinaryfile(filename, nil, 1024)
    ftp.close

    file_data
  end

  def import_all
    IMPORT_ORDER.each do |file_type|
      klass = FILE_IMPORTERS[file_type]
      file_name = "#{file_type}.csv"
      Rails.logger.info "Downloading file from City of Akron FTP file:#{file_name}"
      klass.new(get_file_data(file_name)).import!
    end
  end

  def ftp_connection
    ftp = Net::FTP.new(ENV['FTP_HOST'])
    ftp.passive = true
    ftp.debug_mode = true
    ftp.login(ENV['FTP_USERNAME'], ENV['FTP_PASSWORD'])
    ftp.chdir(ENV['FTP_PATH'])
    ftp
  end
end

