class DropTablePeopleEmploymentStatuses < ActiveRecord::Migration
  
  def change
	drop_table :people_employment_statuses
  end
  
end
