class AddAppraisals < ActiveRecord::Migration[5.0]
  def change
    create_table :parcel_appraisals do |t|
      t.integer :object_id, unsigned: true
      t.integer :parcel_id, unsigned: true
      t.integer :land_value
      t.integer :building_value

      t.timestamps
    end
  end
end
