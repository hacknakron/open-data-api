class Importer
  attr_accessor :data

  def initialize(file_data)
    @data = CSV.new(file_data, :headers => true, :header_converters => :symbol).to_a.map{|row| row.to_hash}
  end

  def import!
    return nil if @data.blank?
  end

  protected
  def convert_date(val)
    return nil if val.blank? || val.try(:downcase) == "none"
    Date.strptime(val, '%m-%d-%Y')
  end

  def convert_int(val)
    return nil if val.blank? || val.try(:downcase) == "none"
    val.try(:to_i)
  end

  def convert_string(val)
    return "" if val.blank? || val.try(:downcase) == "none"
    val
  end
end
