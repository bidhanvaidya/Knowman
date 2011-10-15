class AlterTable < ActiveRecord::Migration
  def change
    remove_column :employment_statuses, :first_name 
    remove_column :employment_statuses, :last_name
  end
end
