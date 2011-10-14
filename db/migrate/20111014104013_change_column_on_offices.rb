class ChangeColumnOnOffices < ActiveRecord::Migration
  def change
    remove_column :offices, :company_permalink
    add_column :offices, :company_permalink, :string
  end
end
