require "reversed/version"
require "net/dns"
require "public_suffix"

module Reversed
  def self.lookup(ip)
    ip = ip.to_s
    unless ip.empty?
      resolver = Net::DNS::Resolver.new(nameservers: ["8.8.8.8", "8.8.4.4"], retry: 3).search(ip)
      answer = resolver.answer.first || resolver.authority.first
      if answer
        hostname = answer.value.split(" ").first[0..-2]
        {
          domain: PublicSuffix.domain(hostname, ignore_private: true),
          hostname: hostname
        }
      end
    end
  end
end
