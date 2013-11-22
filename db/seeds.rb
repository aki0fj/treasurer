# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# coding: utf-8

# Account Type
at = AccountType.all
at.each {|r| r.destroy }
AccountType.create(:id => 1, :type_cd => "1", :type_name_en => "Current assets", :type_name_ja => "流動資産", :account_mode => "1", :bs => true)
AccountType.create(:id => 2, :type_cd => "2", :type_name_en => "Fixed assets", :type_name_ja => "有形固定資産", :account_mode => "1", :bs => true)
AccountType.create(:id => 3, :type_cd => "3", :type_name_en => "Fixed assets", :type_name_ja => "無形固定資産", :account_mode => "1", :bs => true)
AccountType.create(:id => 4, :type_cd => "4", :type_name_en => "Current liabilities", :type_name_ja => "流動負債", :account_mode => "2", :bs => true)
AccountType.create(:id => 5, :type_cd => "5", :type_name_en => "Fixed liabilities", :type_name_ja => "固定負債", :account_mode => "2", :bs => true)
AccountType.create(:id => 6, :type_cd => "6", :type_name_en => "net assets", :type_name_ja => "純資産", :account_mode => "2", :bs => true)
AccountType.create(:id => 7, :type_cd => "7", :type_name_en => "Profit", :type_name_ja => "収益", :account_mode => "1", :pl => true)
AccountType.create(:id => 8, :type_cd => "8", :type_name_en => "Manufacturing cost", :type_name_ja => "製造原価", :account_mode => "2", :pl => true)
AccountType.create(:id => 9, :type_cd => "9", :type_name_en => "Operating costs", :type_name_ja => "営業費", :account_mode => "2", :pl => true)

# Account
require "csv"
ac = Account.all
ac.each {|r| r.destroy }
cnt = 0
##CSV.foreach('db/setup_account.csv', :quote_char => "\"" ) do |ac|
CSV.foreach('db/setup_account.csv') do |ac|
  Account.create(:id => cnt, :acc_cd => ac[0], :acc_name_en => ac[1], :acc_name_ja => ac[2], :account_type_id => ac[3].to_i)
  cnt += 1
end
