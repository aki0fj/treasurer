class LocaleAccName < ActiveRecord::Migration
  def self.up
    rename_column :accounts, :acc_name, :acc_name_en
    add_column :accounts, :acc_name_ja, :string
  end
  def self.down
    rename_column :accounts, :acc_name_en, :acc_name
    remove_column :accounts, :acc_name_ja
  end
end
