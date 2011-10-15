class ActuallyAddIndexes < ActiveRecord::Migration
  def change
    rename_table :employments, :employment_statuses
  end
end
