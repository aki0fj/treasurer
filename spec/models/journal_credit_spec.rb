require 'spec_helper'

describe JournalCredit do
  fixtures :accounts, :journal_debits

  let(:journal_credit) do
    jc = JournalCredit.new
    jc.account_id = 1
    jc.journal_debit_id = 1
    jc
  end

  specify "valid object" do
    expect(journal_credit).to be_valid
  end

  specify "account validation" do
    journal_credit.account = nil
    expect(journal_credit).not_to be_valid
    expect(journal_credit.errors[:account]).to be_present
  end

end
