class JournalCredit < ActiveRecord::Base
  belongs_to :account
  belongs_to :journal_debit, :autosave =>true

  validates :account, :presence => true
end
