require_relative '../src/Boy'
require 'minitest/autorun'


class BoyTest < MiniTest::Unit::TestCase
  def test_get_is_there_empty_slot_available
    test_Boy = Boy.new(0)
    assert_equal false, test_Boy.isThereEmptySlotAvailable();

    test_Boy = Boy.new(3)
    assert_equal true, test_Boy.isThereEmptySlotAvailable();
  end
end


