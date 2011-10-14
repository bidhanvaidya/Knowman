class RenameColumnsOnEmploymentStatusesToPermalink < ActiveRecord::Migration
  def self.up
    rename_column :employment_statuses, :company_id, :company_permalink
    rename_column :employment_statuses, :person_id, :person_permalink
  end

  def self.down
    rename_column :employment_statuses, :company_permalink, :company_id
    rename_column :employment_statuses, :person_permalink, :person_id
  end
end
