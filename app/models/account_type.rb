class AccountType < ActiveRecord::Base
  has_many :accounts

	validates :type_cd, :presence => true, :uniqueness => true
	validates :type_name_en, :presence => true
	validates :type_name_ja, :presence => true
	validates :account_mode, :presence => true
	validates :bs, :presence => true
	validates :pl, :presence => true
end
