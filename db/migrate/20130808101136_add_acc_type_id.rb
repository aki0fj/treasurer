class AddAccTypeId < ActiveRecord::Migration
  def self.up
    add_column :accounts, :account_type_id, :integer
    remove_column :accounts, :acc_type
  end
  def self.down
    add_column :accounts, :acc_type, :string
    remove_column :accounts, :account_type_id
  end
end
