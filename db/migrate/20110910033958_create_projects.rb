class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :staff_numbers
      t.integer :capital

      t.timestamps
    end
  end
end
