require_relative "test_helper"

class ReversedTest < Minitest::Test
  def test_google
    assert_equal "dns.google", Reversed.lookup("8.8.4.4")
  end

  def test_nameservers
    assert_equal "dns.google", Reversed.lookup("8.8.4.4", nameservers: ["8.8.8.8"])
  end

  def test_ipv6
    assert_equal "dns.google", Reversed.lookup("2001:4860:4860::8888")
    # returns nil on CI
    assert_equal "a.ns.facebook.com", Reversed.lookup("2a03:2880:2110:df07:face:b00c::1") unless ENV["CI"]
  end

  def test_nil
    assert_nil Reversed.lookup(nil)
  end

  def test_invalid_ip
    assert_raises(ArgumentError) do
      Reversed.lookup("dns.google")
    end
  end
end
