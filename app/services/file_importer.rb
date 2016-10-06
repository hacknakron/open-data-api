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

    csv = CSV.parse(csv_text, headers: true)

    puts csv

    csv.each do |row|
      ward = Ward.new(
        id: row['OBJECTID_12'].to_i,
        district_id: row['DIST_ID'].to_i,
        distract_name: row['DIST_NAME'],
        ward_id: row['Ward'],
        total_population: row['TOTAL'].to_f,
        dx_dev: row['DX_DEV'].to_f,
        total_dvp: row['TOTAL_DVP'].to_f,
        white_population: row['WHITE'].to_f,
        black_population: row['BLACK'].to_f,
        hispanic_population: row['HISPANIC'].to_f,
        council_person: row['COUNCIL_PERSON'],
        web_link: row['WEB_LINK'],
        global_id: row['GlobalID'],
        shape_st_area: row['Shape_STArea__'],
        shape_st_length: row['Shape_STLength__'])

      if ward.save
        puts "Successful!"
      else
        puts ward.errors.full_messages
      end
    end
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

