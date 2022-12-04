class AddZipcodeToSpaces < ActiveRecord::Migration[7.0]
  def change
    add_column :spaces, :zipcode, :integer
  end
end
