class AddIndexes < ActiveRecord::Migration
  def change
    rename_table :employment_statuses, :employments
  end
end
