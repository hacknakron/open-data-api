class Importer::ParcelSales < Importer

  def import!
    super
    ::ParcelSale.bulk_insert(:object_id, 
                              :parid, 
                              :parcel_id,
                              :sales_date, 
                              :price, 
                              :transaction_date, 
                              :previous_owner, 
                              :new_owner, 
                              :approximate_total, 
                              :updated_at, 
                              :created_at) do |worker|
      data.each do |row|
        obj_id = convert_int(row[:objectid])
        parid = convert_string(row[:parid])
        parcel = Parcel.find_by_parcel_id(row[:parid])
        sales_date = convert_date(row[:salesdt])
        price = convert_int(row[:price])
        transaction_date = convert_date(row[:transdt])
        previous_owner = convert_string(row[:oldown])
        new_owner = convert_string(row[:own1])
        approximate_total = convert_string(row[:own1])
        current_time = DateTime.now.to_s
        
        if parcel
          worker.add(object_id: obj_id, 
                      parid: parid,
                      parcel_id: parcel.id,
                      sales_date: sales_date,
                      price: price,
                      transaction_date: transaction_date,
                      previous_owner: previous_owner,
                      new_owner: new_owner,
                      approximate_total: approximate_total,
                      created_at: current_time, 
                      updated_at: current_time)
        end
      end
    end
  end
end
