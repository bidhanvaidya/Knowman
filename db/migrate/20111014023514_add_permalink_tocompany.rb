class AddPermalinkTocompany < ActiveRecord::Migration
  def change
    add_column :companies, :permalink, :string
  end
end
