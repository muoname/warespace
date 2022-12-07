class AddProvinceToSpaces < ActiveRecord::Migration[7.0]
  def change
    add_column :spaces, :province, :string
  end
end
