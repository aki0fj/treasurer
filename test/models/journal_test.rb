require 'test_helper'

class JournalTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end
  test "data count" do
    j = Journal.all
    assert_equal 2, j.length
  end
end
