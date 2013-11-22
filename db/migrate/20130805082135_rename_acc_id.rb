class RenameAccId < ActiveRecord::Migration
  def self.up
    rename_column :journal_debits, :acc_id, :account_id
    rename_column :journal_credits, :acc_id, :account_id
  end
  def self.down
    rename_column :journal_debits, :account_id, :acc_id
    rename_column :journal_credits, :account_id, :acc_id
  end
end
