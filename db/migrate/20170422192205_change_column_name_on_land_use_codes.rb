class ChangeColumnNameOnLandUseCodes < ActiveRecord::Migration[5.0]
  def change
  	rename_column :land_use_codes, :value, :use_code
  end
end
