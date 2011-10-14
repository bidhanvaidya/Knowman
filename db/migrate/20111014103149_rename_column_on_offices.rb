class RenameColumnOnOffices < ActiveRecord::Migration
  def change
    rename_column :offices, :company_id, :company_permalink
  end
end
