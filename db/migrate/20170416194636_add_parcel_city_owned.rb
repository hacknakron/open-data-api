class AddParcelCityOwned < ActiveRecord::Migration[5.0]
  def change
    add_column :parcels, :city_owned, :boolean, default: false
  end
end
