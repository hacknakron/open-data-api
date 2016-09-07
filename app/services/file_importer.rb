require 'net/ftp'
require 'csv'

class FileImporter

  def get_file(filepath, filename)
    ftp = open_ftp_connection()

    ftp.chdir(filepath)
    file = ftp.getbinaryfile(filename, nil, 1024)

    close_ftp_connection(ftp)

    file
  end

  def import_file(filepath, filename)
    csv_text = get_file(filepath, filename)

    csv = CSV.parse(csv_text, :headers => true)
    puts csv_text
  end

private

  def open_ftp_connection
    ftp = Net::FTP.new

    ftp.debug_mode = true

    ftp.connect(ENV['FTP_HOST'], ENV['FTP_PORT'])
    ftp.login(ENV['FTP_USERNAME'], ENV['FTP_PASSWORD'])

    ftp
  end

  def close_ftp_connection(ftp)
    ftp.close
  end
end
