class FixColumnName < ActiveRecord::Migration
  def up
    rename_column :stlevels, :data_of_record, :date_of_record
  end

  def down
    rename_column :stlevels, :date_of_record, :data_of_record
  end
  
end
