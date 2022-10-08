class CreateSpaces < ActiveRecord::Migration[7.0]
  def change
    create_table :spaces do |t|
      t.integer :space_id
      t.integer :user_id
      t.decimal :price
      t.string :location
      t.string :space_size
      t.string :description
      t.string :photos
      t.boolean :is_occupied

      t.timestamps
    end
  end
end
