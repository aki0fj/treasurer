require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  test "empty attributes" do
    acc = Account.new
    assert !acc.valid?
    assert acc.invalid?(:acc_cd)
    assert acc.invalid?(:acc_name_en)
    assert acc.invalid?(:acc_name_ja)
    assert acc.invalid?(:account_type_id)
  end
  test "unique" do
    acc = Account.new(:acc_cd => accounts(:one).acc_cd,
                      :acc_name_en => "eee",
                      :acc_name_ja => "jjj")
    assert !acc.save
    assert_equal "Acc cd" + I18n.t("errors.messages.taken") , acc.errors.full_messages[0]
  end
end
