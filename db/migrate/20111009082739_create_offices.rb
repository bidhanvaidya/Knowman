class CreateOffices < ActiveRecord::Migration
  def change
    drop_table :offices
  end
end
