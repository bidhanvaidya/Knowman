class AddFkToOffices < ActiveRecord::Migration
  def change
    add_column :offices, :owner, :integer
  end
end
