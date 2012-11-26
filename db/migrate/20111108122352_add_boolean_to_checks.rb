class AddBooleanToChecks < ActiveRecord::Migration
  def change
    add_column :checks, :boolean, :boolean
  end
end
