require 'spec_helper'

describe AccountType do
  fixtures :account_types, :accounts

  let(:account_type) do
    at = AccountType.new
    at.type_cd = "code"
    at.type_name_en = "en"
    at.type_name_ja = "ja"
    at.account_mode = "mode"
    at.bs = true
    at.pl = true
    return at
  end
  
  specify "valid object" do
    expect(account_type).to be_valid
  end

  %w{type_cd type_name_en type_name_ja account_mode bs pl}.each do |column_name|
    specify "validation" do

      account_type[column_name] = nil
      expect(account_type).not_to be_valid
      expect(account_type.errors[column_name]).to be_present
    end
  end
  
  specify "duplicate error" do
    account_type.save
    at = account_type.dup
    at.type_cd = "c2"
    at.save
    at.type_cd = "code"
    at.save
    expect(at.errors[:type_cd]).to be_present
  end
  
  specify "has_many accounts" do
    at = AccountType.find(1)
    expect(at.accounts.count).to eq(2)
  end
end
