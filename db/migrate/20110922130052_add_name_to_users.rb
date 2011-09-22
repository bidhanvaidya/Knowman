class AddNameToUsers < ActiveRecord::Migration
  def up
		add_column :users, :lastname, :string
		rename_column :users, :name, :firstname
  end
end
