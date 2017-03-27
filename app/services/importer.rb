class Importer
  attr_accessor :data

  def initialize(file_data)
    @data = CSV.new(file_data, :headers => true, :header_converters => :symbol).to_a.map{|row| row.to_hash}
  end

  def import!
    return nil if @data.blank?
  end

  protected
  def convert_string(val)
    return "" if val.downcase == "none" || val.blank?
    val
  end
end