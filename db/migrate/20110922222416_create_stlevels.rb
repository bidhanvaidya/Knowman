class CreateStlevels < ActiveRecord::Migration
  def change
    create_table :stlevels do |t|
      t.datetime :data_of_record
      t.integer :staff_number
      t.references :company

      t.timestamps
    end
    add_index :stlevels, :company_id
  end
end
