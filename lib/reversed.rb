require "reversed/version"
require "net/dns"

module Reversed
  def self.lookup(ip, timeout: 5, nameservers: nil)
    ip = ip.to_s
    unless ip.empty?
      options = {
        retry: 3,
        udp_timeout: timeout
      }
      options[:nameservers] = nameservers if nameservers
      begin
        resolver = Net::DNS::Resolver.new(options).search(ip)
        answer = resolver.answer.first || resolver.authority.first
        if answer && !answer.value.empty?
          answer.value.split(" ").first[0..-2]
        end
      rescue Net::DNS::Resolver::NoResponseError
        nil
      end
    end
  end
end
