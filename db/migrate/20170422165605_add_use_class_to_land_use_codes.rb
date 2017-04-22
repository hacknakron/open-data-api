class AddUseClassToLandUseCodes < ActiveRecord::Migration[5.0]
  def change
    add_column :land_use_codes, :use_class, :string, index: true
  end
end
