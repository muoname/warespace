class CreateRents < ActiveRecord::Migration[7.0]
  def change
    create_table :rents do |t|
      t.integer :space_id
      t.integer :user_id
      t.decimal :duration

      t.timestamps
    end
  end
end
