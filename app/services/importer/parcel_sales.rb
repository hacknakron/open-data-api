class Importer::ParcelSales < Importer

  def import!
    super
    data.each do |row|
      parcel_sale = ParcelSale.find_or_initialize_by({object_id: row[:objectid]})

      parcel_sale.assign_attributes({
        parid: convert_string(row[:parid]),
        parcel: Parcel.find_by_parcel_id(row[:parid]),
        sales_date: convert_date(row[:salesdt]),
        price: convert_int(row[:price]),
        transaction_date: convert_date(row[:transdt]),
        previous_owner: convert_string(row[:oldown]),
        new_owner: convert_string(row[:own1]),
        approximate_total: convert_int(row[:aprtot])
      })

      next if (parcel_sale.sales_date.blank? ||
               parcel_sale.parcel.blank? ||
               parcel_sale.previous_owner.blank? ||
               parcel_sale.new_owner.blank?)

      parcel_sale.save! if parcel_sale.changed? || parcel_sale.new_record?
    end
  end
end
