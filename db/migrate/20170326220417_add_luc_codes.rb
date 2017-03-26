class AddLucCodes < ActiveRecord::Migration[5.0]
  def change
    create_table :land_use_codes do |t|
      t.integer :object_id, unsigned: true
      t.integer :value
      t.string :label

      t.timestamps
    end
  end
end
