class AddParIdToParcelSale < ActiveRecord::Migration[5.0]
  def change
    add_column :parcel_sales, :parid, :string, index: true
  end
end
