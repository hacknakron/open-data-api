class Importer::Parcels < Importer

  def import!
    super
    data.each do |row|
      parcel = ::Parcel.find_or_initialize_by({object_id: row[:objectid]})

      land_use_code = LandUseCode.find_by_value(row[:luc])

      parcel.assign_attributes({parcel_id: convert_int(row[:parid]),
                                tax_year: convert_int(row[:taxyr]),
                                alternate_id: convert_string(row[:alt_id]),
                                address_number: convert_int(row[:adrno]),
                                address_direction: convert_string(row[:adrdir]),
                                address_street: convert_string(row[:adrstr]),
                                address_suffix: convert_string(row[:adrsuf]),
                                address_suffix_2: convert_string(row[:adrsuf2]),
                                address: convert_string(row[:addr]),
                                zip_code: convert_int(row[:zip]),
                                land_use_code: land_use_code,
                                acres: convert_string(row[:calcares]),
                                current_resident_1: convert_string(row[:mail1]),
                                current_resident_2: convert_string(row[:mail2]),
                                owner_1: convert_string(row[:own1]),
                                owner_2: convert_string(row[:own2]),
                                owner_address_1: convert_string(row[:ownaddr1]),
                                owner_address_2: convert_string(row[:ownaddr2]),
                                owner_address_3: convert_string(row[:ownaddr3]),
                                owner_zip_code: convert_int(row[:ownzip1]),
                                owner_zip_code_2: convert_int(row[:ownzip2]),
                                owner_city: convert_string(row[:cityname]),
                                owner_state: convert_string(row[:statecode]),
                                description: convert_string(row[:description])
                               })

      next if parcel.parcel_id.blank?

      parcel.save! if parcel.changed? || parcel.new_record?
    end
  end
end
























