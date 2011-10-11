class AddColumnCompanyIdToTables < ActiveRecord::Migration
  def change
	add_column :products, :company_id, :integer
	add_column :offices, :company_id, :integer
  end
end
