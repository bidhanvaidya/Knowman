class CreateEmploymentStatuses < ActiveRecord::Migration
  def change
    create_table :employment_statuses do |t|
      t.string :is_true
      t.string :title

      t.timestamps
    end
  end
end
