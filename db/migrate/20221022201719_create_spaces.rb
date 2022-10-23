class CreateSpaces < ActiveRecord::Migration[7.0]
  def change
    create_table :spaces do |t|
      t.integer :user_id
      t.string :spacecategory_id
      t.string :title
      t.text :location
      t.text :description
      t.string :space_size
      t.decimal :weekly_rate
      t.float :longitude
      t.float :latitude
      t.text :space_policies

      t.timestamps
    end
  end
end
