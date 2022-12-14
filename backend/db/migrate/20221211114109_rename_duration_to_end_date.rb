class RenameDurationToEndDate < ActiveRecord::Migration[7.0]
  def change
    rename_column(:rents, :duration, :end_date)
  end
end
