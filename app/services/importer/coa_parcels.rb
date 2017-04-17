class Importer::COAParcels < Importer

  def import!
    super
    data.each do |row|
      parcel = Parcel.find_by_parcel_id(row[:parid])
      next if parcel.blank?
      parcel.update_attribute(:city_owned, true)
    end
  end

end