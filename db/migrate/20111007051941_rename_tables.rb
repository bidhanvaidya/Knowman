class RenameTables < ActiveRecord::Migration
  def self.up
    rename_table :stlevels, :staff_levels
  end

  def self.down
    rename_table :staff_levels, :stlevels
  end
end
