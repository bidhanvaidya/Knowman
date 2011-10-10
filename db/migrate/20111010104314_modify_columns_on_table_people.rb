class ModifyColumnsOnTablePeople < ActiveRecord::Migration
  def self.up
  
	rename_column	:people, :name, :first_name
	add_column		:people, :last_name, :string
	add_column		:people, :permalink, :string
  
  end

  def self.down
  
	remove_column	:people, :last_name
	remove_column	:people, :permalink
	rename_column	:people, :first_name, :name
  
  end
end
