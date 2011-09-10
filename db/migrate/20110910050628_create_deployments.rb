class CreateDeployments < ActiveRecord::Migration
  def change
    create_table :deployments do |t|
      t.integer :project_id
      t.integer :company_id

      t.timestamps
    end
  end
end
