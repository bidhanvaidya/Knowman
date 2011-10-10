class AddColumnTitleToPeopleEmploymentStatuses < ActiveRecord::Migration
  def change

	add_column :people_employment_statuses, :title, :string

  end
end
