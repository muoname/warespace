class CreateSpacecategories < ActiveRecord::Migration[7.0]
  def change
    create_table :spacecategories do |t|
      t.string :category_name

      t.timestamps
    end
  end
end
