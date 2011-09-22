class ChangeNameForUsers < ActiveRecord::Migration
  def up
		rename_column :users, :firstname, :firstName
		rename_column :users, :lastname, :lastName  
	end

  def down
	
		rename_column :users, :firstName, :firstname
		rename_column :users, :lastName, :lastname
  end
end
