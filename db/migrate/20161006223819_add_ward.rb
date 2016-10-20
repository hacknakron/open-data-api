class AddWard < ActiveRecord::Migration[5.0]
  def change
    create_table :wards do |t|
      t.integer :district_id
      t.string :distract_name
      t.string :ward_id
      t.float :total_population
      t.float :dx_dev
      t.float :total_dvp
      t.float :white_population
      t.float :black_population
      t.float :hispanic_population
      t.string :council_person
      t.string :web_link
      t.string :global_id
      t.string :shape_st_area
      t.string :shape_st_length
    end
  end
end
