class AddNeighborhood < ActiveRecord::Migration[5.0]
  def change
    create_table :neighborhood do |t|
      t.string :value

      t.timestamps
    end
  end
end
