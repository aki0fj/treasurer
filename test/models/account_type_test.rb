require 'test_helper'

class AccountTypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
	test "empty attributes" do
		at = AccountType.new
		assert !at.valid?
		assert at.invalid?(:type_cd)
		assert at.invalid?(:type_name_en)
		assert at.invalid?(:type_name_ja)
		assert at.invalid?(:account_mode)
		assert at.invalid?(:bs)
		assert at.invalid?(:pl)
	end

  test "unique" do
	  at = AccountType.new(:type_cd => account_types(:one).type_cd,
			 :type_name_en => "eee", :type_name_ja => "jjj",
			 :account_mode => "aaa", :bs => true, :pl => true)
    assert !at.save
    assert_equal "Type cd" + I18n.t("errors.messages.taken") , at.errors.full_messages[0]
  end
end
