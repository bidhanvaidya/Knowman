class RenameTableFundsToFundingRounds < ActiveRecord::Migration
  def up
    rename_table :funds, :funding_rounds
  end

  def down
    rename_table :funding_rounds, :funds
  end
end
