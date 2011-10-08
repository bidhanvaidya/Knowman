class RenameCompanyToCompanies < ActiveRecord::Migration
  def change
	rename_table :company, :companies
  end
end
