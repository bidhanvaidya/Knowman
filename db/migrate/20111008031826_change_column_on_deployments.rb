class ChangeColumnOnDeployments < ActiveRecord::Migration
  def up
	remove_column :deployments, :product_id, :company_id
  end
  def down
	add_column :deployments, :product_id, :company_id
 end
end
