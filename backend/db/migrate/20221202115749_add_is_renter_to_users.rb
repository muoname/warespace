class AddIsRenterToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :is_renter, :boolean
  end
end
