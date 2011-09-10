class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :project_id
      t.integer :person_id

      t.timestamps
    end
  end
end
