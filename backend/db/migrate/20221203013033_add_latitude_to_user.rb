class AddLatitudeToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :latitude, :float
  end
end
