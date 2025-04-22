require_relative "test_helper"

class ReversedTest < Minitest::Test
  def test_ipv4
    assert_equal "dns.google", Reversed.lookup("8.8.4.4")
  end

  def test_nameservers
    assert_equal "dns.google", Reversed.lookup("8.8.4.4", nameservers: ["8.8.8.8"])
  end

  def test_timeout
    assert_nil Reversed.lookup("10.255.255.1", timeout: 0.0001)
  end

  def test_fallback
    assert_equal "darl.ns.cloudflare.com", Reversed.lookup("103.21.244.0")
    assert_nil Reversed.lookup("103.21.244.0", fallback: false)
  end

  def test_ipv6
    assert_equal "one.one.one.one", Reversed.lookup("2606:4700:4700::1111")
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
