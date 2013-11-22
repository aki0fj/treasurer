class JournalDebit < ActiveRecord::Base

  include ActiveRecord::Calculations

  belongs_to :account
  has_one :journal_credit, :dependent => :destroy

  accepts_nested_attributes_for :journal_credit, :allow_destroy => :true,
     :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

  validates :account, :presence => true
  validates :amount, :presence => true
end
