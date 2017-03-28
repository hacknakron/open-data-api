class AddParcels < ActiveRecord::Migration[5.0]
  def change
    create_table :parcels do |t|
      t.integer :object_id, unsigned: true
      t.integer :parcel_id, unsigned: true
      t.integer :tax_year
      t.string :alternate_id
      t.integer :address_number
      t.string :address_direction
      t.string :address_street
      t.string :address_suffix
      t.string :address_suffix_2
      t.string :address
      t.integer :zip_code
      t.string :acres
      t.string :current_resident_1
      t.string :current_resident_2
      t.string :owner_1
      t.string :owner_2
      t.string :owner_address_1
      t.string :owner_address_2
      t.string :owner_address_3
      t.integer :owner_zip_code
      t.integer :owner_zip_code_2
      t.string :owner_city
      t.string :owner_state
      t.string :description
      t.datetime :rental_date
      t.integer :parcel_class_id, foreign_key: true
      t.integer :land_use_code_id, foreign_key: true
      t.integer :neighborhood_id, foreign_key: true

      t.timestamps
    end
  end
end
