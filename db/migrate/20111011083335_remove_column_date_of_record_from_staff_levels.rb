class RemoveColumnDateOfRecordFromStaffLevels < ActiveRecord::Migration
  def self.up
	remove_column :staff_levels, :date_of_record
  end

  def self.down
	add_column :staff_levels, :date_of_record
  end
end
