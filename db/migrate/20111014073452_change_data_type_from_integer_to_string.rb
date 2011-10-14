class ChangeDataTypeFromIntegerToString < ActiveRecord::Migration
  def change
  
    change_table :employment_statuses do |t|
      t.change(:company_id, :string)
      t.change(:person_id, :string)
    end
  
  end
end
