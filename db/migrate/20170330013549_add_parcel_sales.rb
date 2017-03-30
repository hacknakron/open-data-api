class AddParcelSales < ActiveRecord::Migration[5.0]
  def change
    create_table :parcel_sales do |t|
      t.integer :object_id, unsigned: true, null: false
      t.integer :parcel_id, unsigned: true, null: false
      t.datetime :sales_date, null: false
      t.integer :price, unsigned: true, null: true
      t.datetime :transaction_date, null: true
      t.string :previous_owner, null: true
      t.string :new_owner, null: true
      t.integer :approximate_total, unsigned: true, null: true

      t.timestamps
    end
  end
end
