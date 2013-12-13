require 'spec_helper'

describe JournalDebit do
  fixtures :accounts

  let(:journal_debit) do
    jd = JournalDebit.new
    jd.occur_on = "2013-12-12"
    jd.account = accounts(:one)
    jd.amount = 1000
    jd
  end

  specify "valid object" do
    expect(journal_debit).to be_valid
  end

  %w{occur_on amount}.each do |column_name|
    specify "#{column_name} validation" do
      journal_debit[column_name.to_sym] = nil
      expect(journal_debit).not_to be_valid
      expect(journal_debit.errors[column_name]).to be_present
    end
  end

  specify "account validation" do
    journal_debit.account = nil
    expect(journal_debit).not_to be_valid
    expect(journal_debit.errors[:account]).to be_present
  end
end
