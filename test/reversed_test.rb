require_relative "test_helper"

class ReversedTest < Minitest::Test
  def test_google
    result = Reversed.lookup("8.8.4.4")
    assert_equal "google.com", result[:domain]
    assert_equal "google-public-dns-b.google.com", result[:hostname]
  end

  def test_nil
    assert_nil Reversed.lookup(nil)
  end
end
