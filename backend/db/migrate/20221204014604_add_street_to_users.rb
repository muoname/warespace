class AddStreetToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :street, :string
  end
end
