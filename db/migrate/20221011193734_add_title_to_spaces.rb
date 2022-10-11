class AddTitleToSpaces < ActiveRecord::Migration[7.0]
  def change
    add_column :spaces, :title, :string
  end
end
