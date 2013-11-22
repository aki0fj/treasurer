class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :acc_cd
      t.string :acc_name
      t.string :acc_type
      t.timestamps
    end
    add_index :accounts, [ :acc_cd, :acc_name ], unique: true
  end
end
