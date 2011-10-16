class AddDateOfRecordToStaffLevels < ActiveRecord::Migration
  def change
    add_column :staff_levels, :date_of_record, :datetime
  end
end
