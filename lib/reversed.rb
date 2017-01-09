require "reversed/version"
require "net/dns"

module Reversed
  def self.lookup(ip)
    ip = ip.to_s
    unless ip.empty?
      resolver = Net::DNS::Resolver.new(retry: 3).search(ip)
      answer = resolver.answer.first || resolver.authority.first
      answer.value.split(" ").first[0..-2] if answer
    end
  end
end
