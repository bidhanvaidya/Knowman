class AddColumnPersonIdToEmploymentStatuses < ActiveRecord::Migration
  def change
	add_column :employment_statuses, :company_id, :integer
	add_column :employment_statuses, :person_id, :integer
  end
end
