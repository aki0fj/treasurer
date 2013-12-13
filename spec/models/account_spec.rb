require 'spec_helper'

describe Account do
  fixtures :account_types

  let(:account) do
    ac = Account.new
    ac.acc_cd = "code"
    ac.acc_name_en = "en"
    ac.acc_name_ja = "ja"
    ac.account_type_id = 1
    ac
  end

  specify "valid object" do
    expect(account).to be_valid
  end

  %w{acc_cd acc_name_en acc_name_ja}.each do |column_name|
    specify "validation" do
      account[column_name] = nil
      expect(account).not_to be_valid
      expect(account.errors[column_name]).to be_present
    end
  end

  specify "duplicate error" do
    account.save
    ac2 = account.dup
    ac2.acc_cd = "2"
    ac2.save
    ac2.acc_cd = account.acc_cd
    ac2.save
    expect(ac2.errors[:acc_cd]).to be_present
  end

  specify "belongs_to account_type" do
    account.save
    ac = Account.find(1)
    expect(ac.account_type.id).to eq(1)
  end
end
