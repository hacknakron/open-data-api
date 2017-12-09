class Importer::LandUseCodes < Importer

  def import!
    super
    # data.each do |row|
    #   land_use_code = ::LandUseCode.find_or_initialize_by({object_id: row[:objectid]})
    #   use_class=convert_string(row[:msg]).split[0]
    #   land_use_code.assign_attributes({object_id: convert_int(row[:objectid]), use_code: convert_int(row[:val]),
    #    label: convert_string(row[:msg]), use_class: use_class})
    #   land_use_code.save! if land_use_code.changed? || land_use_code.new_record?
    # end
    ::LandUseCode.bulk_insert(:object_id, :use_code, :label, :use_class, :created_at, :updated_at) do |worker|
      data.each do |row|
        current_time = DateTime.now.to_s
        obj_id = convert_int(row[:objectid])
        use_code = convert_int(row[:val])
        label = row[:msg]
        use_class = convert_string(row[:msg]).split[0]
        # ::LandUseCode.
        
        worker.add object_id: obj_id, use_code: use_code, label: label, use_class: use_class, created_at: current_time, updated_at: current_time
      end
    end
  end
end