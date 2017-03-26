class AddWard < ActiveRecord::Migration[5.0]
  def change
    create_table :wards do |t|
      t.integer :object_id
      t.string :district_id
      t.string :district_name
      t.string :ward_name
      t.string :ward_id
      t.float :total_population
      t.float :white_population
      t.float :black_population
      t.float :hispanic_population
      t.string :council_person
      t.string :web_link
    end
  end
end
