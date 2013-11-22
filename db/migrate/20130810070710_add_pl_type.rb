class AddPlType < ActiveRecord::Migration
  def self.up
    rename_column :account_types, :bs_type_cd, :type_cd
    rename_column :account_types, :bs_type_name_en, :type_name_en
    rename_column :account_types, :bs_type_name_ja, :type_name_ja
    add_column :account_types, :bs, :boolean
    add_column :account_types, :pl, :boolean
  end
  def self.down
    rename_column :account_types, :type_cd, :bs_type_cd
    rename_column :account_types, :type_name_en, :bs_type_name_en
    rename_column :account_types, :type_name_ja, :bs_type_name_ja
    remove_column :account_types, :bs, :boolean
    remove_column :account_types, :pl, :boolean
  end
end
