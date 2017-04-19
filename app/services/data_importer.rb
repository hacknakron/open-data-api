require 'csv'

class DataImporter
  IMPORT_ORDER = [:LUCCODES, :CAMAPARDAT, :COAPARCELS, :CAMASALES, :CAMAAPRVAL].freeze
  FILE_IMPORTERS = {LUCCODES: Importer::LandUseCodes,
                    CAMAPARDAT: Importer::Parcels,
                    COAPARCELS: Importer::COAParcels,
                    CAMASALES: Importer::ParcelSales,
                    CAMAAPRVAL: Importer::ParcelAppraisals}.freeze

  def get_file_data(filename)
    ::COAFTPConnection.with_connection do |ftp|
      ftp.getbinaryfile(filename, nil, 1024)
    end
  end

  def import_all
    IMPORT_ORDER.each do |file_type|
      klass = FILE_IMPORTERS[file_type]
      filename = "#{file_type}.csv"
      Rails.logger.info "Downloading file from City of Akron FTP file:#{filename}"
      klass.new(get_file_data(filename)).import!
    end
  end
end

