class CreateNewTablesForNormalisation < ActiveRecord::Migration
  def self.up
    rename_table :employments, :person_employment_status
  end

  def self.down
    rename_table :person_employment_status, :employments
  end
end
