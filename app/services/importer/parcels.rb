class Importer::Parcels < Importer

  def import!
    super
    data.each do |row|
      parcel = Parcel.find_or_initialize_by({object_id: row[:objectid]})

      land_use_code = LandUseCode.find_by_value(row[:luc])

      parcel.assign_attributes({parcel_id: convert_string(row[:parid]),
                                tax_year: convert_string(row[:taxyr]),
                                alternate_id: convert_string(row[:alt_id]),
                                address_number: convert_string(row[:adrno]),
                                address_direction: row[:adrdir],
                                address_street: row[:adrstr],
                                address_suffix: row[:adrsuf],
                                address_suffix_2: row[:adrsuf2],
                                address: row[:addr],
                                zip_code: row[:zip],
                                neighborhood_id: row[:nbhd],
                                parcel_class_id: row[:class],
                                land_use_code: land_use_code,
                                acres: row[:acres],
                                current_resident_1: row[:mail1],
                                current_resident_2: row[:mail2],
                                owner_1: row[:own1],
                                owner_2: row[:own2],
                                owner_address_1: row[:ownaddr1],
                                owner_address_2: row[:ownaddr2],
                                owner_address_3: row[:ownaddr3],
                                owner_zip_code: row[:ownzip1],
                                owner_zip_code_2: row[:ownzip2],
                                owner_city: row[:cityname],
                                owner_state: row[:statecode],
                                description: row[:description],
                                rental_date: row[:isrental]})

      next if parcel.parcel_id.blank?

      parcel.save! if parcel.changed? || parcel.new_record?
    end
  end
end
























