class RenameTablesToMatchCrunchbaseJsonKeys < ActiveRecord::Migration
  def self.up
    rename_table :companies, :company
	rename_table :people, :person
	rename_table :funds, :funding_rounds
	rename_table :projects, :products
  end

  def self.down
    rename_table :company, :companies
	rename_table :person, :people
	rename_table :funding_rounds, :funds
	rename_table :products, :projects
  end
end
