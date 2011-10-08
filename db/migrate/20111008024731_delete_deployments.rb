class DeleteDeployments < ActiveRecord::Migration
  def change
	drop_table :deployments
  end
end
