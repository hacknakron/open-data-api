class Importer::Parcels < Importer

  def import!
    super
    ::Parcel.bulk_insert(:object_id,
                          :parcel_id,
                          :tax_year,
                          :alternate_id,
                          :address_number,
                          :address_direction,
                          :address_street,
                          :address_suffix,
                          :address_suffix_2,
                          :address,
                          :zip_code,
                          :land_use_code_id,
                          :acres,
                          :current_resident_1,
                          :current_resident_2,
                          :owner_1,
                          :owner_2,
                          :owner_address_1,
                          :owner_address_2,
                          :owner_address_3,
                          :owner_zip_code,
                          :owner_zip_code_2,
                          :owner_city,
                          :owner_state,
                          :description,
                          :use_class,
                          :use_code,
                          :created_at, 
                          :updated_at) do |worker|
      land_use_codes = {}
      LandUseCode.all.to_a.each do |land_use_code|
        land_use_codes[land_use_code.use_code.to_s] ||= land_use_code.id
      end

      data.each do |row|
        land_use_code = land_use_codes[row[:luc]]
        current_time = DateTime.now.to_s
        worker.add(object_id: convert_int(row[:objectid]),
                  parcel_id: convert_int(row[:parid]),
                  tax_year: convert_int(row[:taxyr]),
                  alternate_id: convert_string(row[:alt_id]),
                  address_number: convert_int(row[:adrno]),
                  address_direction: convert_string(row[:adrdir]),
                  address_street: convert_string(row[:adrstr]),
                  address_suffix: convert_string(row[:adrsuf]),
                  address_suffix_2: convert_string(row[:adrsuf2]),
                  address: convert_string(row[:addr]),
                  zip_code: convert_int(row[:zip]),
                  land_use_code_id: land_use_code,
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
                  description: convert_string(row[:description]),
                  use_class: convert_string(row[:class]),
                  use_code: convert_int(row[:luc]), 
                  created_at: current_time, 
                  updated_at: current_time)
      end
    end
  end
end
























