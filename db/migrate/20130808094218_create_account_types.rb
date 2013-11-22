class CreateAccountTypes < ActiveRecord::Migration
  def change
    create_table :account_types do |t|
      t.string  :bs_type_cd
      t.string  :bs_type_name_en
      t.string  :bs_type_name_ja
      t.string  :account_mode

      t.timestamps
    end
  end
end
