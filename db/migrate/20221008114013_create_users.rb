class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.integer :user_id
      t.string :email
      t.string :password
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :phone
      t.boolean :is_renter

      t.timestamps
    end
  end
end
