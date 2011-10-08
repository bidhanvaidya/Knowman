class RenameTablePersonToPeople < ActiveRecord::Migration
  def change
    rename_table :person, :people
    rename_table :person_employment_status, :people_employment_statuses
  end
end
