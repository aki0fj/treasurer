class Account < ActiveRecord::Base
  belongs_to :account_type
  has_many :journal_credits
  has_many :journal_debits

  validates :acc_cd, :presence => true, :uniqueness => true
  validates :acc_name_en, :presence => true
  validates :acc_name_ja, :presence => true
end
