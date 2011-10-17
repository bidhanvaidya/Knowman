class CreateResearches < ActiveRecord::Migration
  def change
    create_table :researches do |t|
      t.string :title

      t.timestamps
    end
  end
end
