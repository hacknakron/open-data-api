class Importer::ParcelAppraisals < Importer

  def import!
    super
    data.each do |row|
      parcel_appraisal = ParcelAppraisal.find_or_initialize_by({object_id: row[:objectid]})

      parcel_appraisal.assign_attributes({parcel: Parcel.find_by_parcel_id(row[:parid]),
                                          land_value: convert_int(row[:land_val]),
                                          building_value: convert_int(row[:bldg_val])})

      next if parcel_appraisal.land_value.blank? || parcel_appraisal.building_value.blank? || parcel_appraisal.parcel.blank?

      parcel_appraisal.save! if parcel_appraisal.changed? || land_use_code.new_record?
    end
  end
end