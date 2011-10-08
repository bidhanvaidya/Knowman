class CreateTableDeployments < ActiveRecord::Migration
  def self.up
    create_table :deployments do |t|
      t.datetime :created_at
	  t.datetime :updated_at
      t.integer :company_id
	  t.integer :product_id
      t.references :companies
	  t.references :products

      t.timestamps
    end
  end
  def self.down
	drop_table :deployments
  end
end
