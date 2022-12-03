class CreateRents < ActiveRecord::Migration[7.0]
  def change
    create_table :rents do |t|
      t.integer :user_id
      t.integer :space_id
      t.date :duration

      t.timestamps
    end
  end
end
