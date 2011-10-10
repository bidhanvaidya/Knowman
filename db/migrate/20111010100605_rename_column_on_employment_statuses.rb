class RenameColumnOnEmploymentStatuses < ActiveRecord::Migration

  def up
	rename_column :employment_statuses, :is_true, :is_past
  end

  def down
	rename_column :employment_statuses, :is_past, :is_true
  end

end
