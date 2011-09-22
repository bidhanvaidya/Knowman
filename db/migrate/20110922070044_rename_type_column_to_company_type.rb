class RenameTypeColumnToCompanyType < ActiveRecord::Migration
  def up
    rename_column :company, :type, :company_type
  end

  def down
    rename_column :company, :company_type, :type
  end
end
