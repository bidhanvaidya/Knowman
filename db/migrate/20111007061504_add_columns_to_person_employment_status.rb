class AddColumnsToPersonEmploymentStatus < ActiveRecord::Migration
  def change
    add_column :person_employment_status, :is_past, :boolean
  end
end
