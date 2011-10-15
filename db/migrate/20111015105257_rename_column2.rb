class RenameColumn2 < ActiveRecord::Migration
  def up
    rename_column :employment_statuses, :person_id, :person_permalink
  end

  def down
    rename_column :employment_statuses, :person_permalink, :person_id
  end
end
