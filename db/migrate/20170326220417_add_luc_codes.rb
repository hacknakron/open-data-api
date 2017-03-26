class AddLucCodes < ActiveRecord::Migration[5.0]
  def change
    create_table :luc_codes do |t|
      t.integer :object_id, unsigned: true
      t.integer :value
      t.string :message

      t.timestamps
    end
  end
end
