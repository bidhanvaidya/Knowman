class RenameColumnOnStaffLevels < ActiveRecord::Migration
  def self.up
	rename_column :staff_levels, :staff_number, :number_of_employees
  end
  def self.down
	rename_column :staff_levels, :number_of_employees, :staff_number
  end
end
