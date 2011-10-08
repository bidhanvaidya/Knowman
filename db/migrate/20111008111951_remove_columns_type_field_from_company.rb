class RemoveColumnsTypeFieldFromCompany < ActiveRecord::Migration
  def self.up
  
	remove_column :companies, :company_type, :company_field
  
  end

  def self.down
  
	add_column :companies, :company_type, :company_field
  
  end
end
