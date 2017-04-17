require 'net/ftp'
class COAFTPConnection

  def self.with_connection(&block)
    begin
      Rails.logger.info "Opening COA FTP connection"
      connection = ftp_connection
      block.call(connection)
    ensure
      Rails.logger.info "Closing COA FTP connection"
      connection.close
    end
  end

  protected
  def self.ftp_connection
    ftp = ::Net::FTP.new(ENV['FTP_HOST'])
    ftp.passive = true
    ftp.debug_mode = true
    ftp.login(ENV['FTP_USERNAME'], ENV['FTP_PASSWORD'])
    ftp.chdir(ENV['FTP_PATH'])
    ftp
  end
end