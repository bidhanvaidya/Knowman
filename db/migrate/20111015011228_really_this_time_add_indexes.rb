class ReallyThisTimeAddIndexes < ActiveRecord::Migration
  def change
  
    add_index :companies, [:name, :permalink], :unique => true
    add_index :offices, [:company_permalink, :latitude, :longitude], :unique => true
    add_index :people, [:first_name, :last_name, :permalink], :unique => true
    add_index :products, [:permalink, :company_permalink], :unique => true
    add_index :staff_levels, [:number_of_employees, :created_at], :unique => true
    
  end
end
