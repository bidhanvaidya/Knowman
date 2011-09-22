class CreateFunds < ActiveRecord::Migration
  def change
    create_table :funds do |t|
      t.datetime :date_of_record
      t.integer :money
      t.references :company

      t.timestamps
    end
    add_index :funds, :company_id
  end
end
