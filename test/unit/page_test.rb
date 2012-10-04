require 'test_helper'

class PageTest < ActiveSupport::TestCase
  test "only include enabled pages" do
    p = pages(:one)

    assert_equal pages(:two), p.prev, "did not wrap around to last enabled page"
    assert_not_equal pages(:three), p.prev, "returned a disabled page on 'prev'"
    assert_equal pages(:two), p.next, "did not return the expected next page"

    p = pages(:two)

    assert_equal pages(:one), p.prev, "did not return the expected previous page"
    assert_not_equal pages(:three), p.next, "returned a disabled page on 'next'"
    assert_equal pages(:one), p.next, "did not wrap around to beginning"
  end
end
