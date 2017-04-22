class AddUseCodeAndUseClassToParcels < ActiveRecord::Migration[5.0]
  def change
    add_column :parcels, :use_code, :integer, index: true
    add_column :parcels, :use_class, :string, index: true
  end

end
