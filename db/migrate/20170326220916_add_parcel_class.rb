class AddParcelClass < ActiveRecord::Migration[5.0]
  def change
    create_table :parcel_classes do |t|
      t.string :value

      t.timestamps
    end
  end
end
