class RenameDangerousFieldsOnCompany < ActiveRecord::Migration
  def up
    rename_column :companies, :type, :company_type
    rename_column :companies, :field, :company_field
  end

  def down
    rename_column :companies, :company_type, :type
    rename_column :companies, :company_field, :field
  end
end
