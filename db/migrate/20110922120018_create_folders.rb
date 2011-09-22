class CreateFolders < ActiveRecord::Migration
  def change
    create_table :folders do |t|
      t.integer :research_id
      t.string :title
      t.integer :user_id

      t.timestamps
    end
  end
end
