require_relative "test_helper"

class ReversedTest < Minitest::Test
  def test_google
    assert_equal "google-public-dns-b.google.com", Reversed.lookup("8.8.4.4")
  end

  def test_nameservers
    assert_equal "google-public-dns-b.google.com", Reversed.lookup("8.8.4.4", nameservers: ["8.8.8.8"])
  end

  def test_nil
    assert_nil Reversed.lookup(nil)
  end
end
