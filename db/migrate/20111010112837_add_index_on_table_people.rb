class AddIndexOnTablePeople < ActiveRecord::Migration
  def change
  
	add_index :people, [:first_name, :permalink]
  
  end
end
