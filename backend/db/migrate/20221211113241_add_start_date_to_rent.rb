class AddStartDateToRent < ActiveRecord::Migration[7.0]
  def change
    add_column :rents, :start_date, :date
  end
end
