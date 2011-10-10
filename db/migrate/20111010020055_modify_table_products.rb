class ModifyTableProducts < ActiveRecord::Migration
  def self.up
  
	remove_column	:products, :capital
	remove_column	:products, :staff_numbers
	add_column		:products, :permalink, :string
  
  end

  def self.down
  
	add_column :products, :staff_numbers
	add_column :capital
	remove_column :products, :permalink
  
  end
end
