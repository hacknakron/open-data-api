class Importer::ParcelAppraisals < Importer

  def import!
    super
    ::ParcelAppraisal.bulk_insert(:object_id, :parcel_id, :land_value, :building_value, :created_at, :updated_at) do |worker|
      data.each do |row|
        obj_id = convert_int(row[:objectid])
        parcel = Parcel.find_by_parcel_id(row[:parid])
        land_value = row[:msg]
        building_value = convert_string(row[:msg]).split[0]
        current_time = DateTime.now.to_s
        
        if parcel
          worker.add(object_id: obj_id, 
                      parcel_id: parcel.id, 
                      land_value: convert_int(row[:land_val]), 
                      building_value: convert_int(row[:bldg_val]), 
                      created_at: current_time, 
                      updated_at: current_time)
        end
      end
    end
  end
end