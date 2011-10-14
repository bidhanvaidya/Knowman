class ChangeAllIdsToPermalinks < ActiveRecord::Migration
  def change
    remove_column :products, :company_id
    add_column :products, :company_permalink, :string
    remove_column :staff_levels, :company_id
    add_column :staff_levels, :company_permalink, :string
  end
end
