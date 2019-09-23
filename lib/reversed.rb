require "reversed/version"
require "net/dns"
require "ipaddr"

module Reversed
  def self.lookup(ip, timeout: 5, nameservers: nil)
    ip = ip.to_s
    unless ip.empty?
      begin
        # ensure valid ip
        ip = IPAddr.new(ip)
      rescue IPAddr::InvalidAddressError
        raise ArgumentError, "Invalid IP"
      end

      options = {
        retry_number: 3,
        udp_timeout: timeout
      }
      options[:nameservers] = nameservers if nameservers
      begin
        resolver = Net::DNS::Resolver.new(options).search(ip.to_string)
        answer = resolver.answer.first || resolver.authority.first
        if answer && !answer.value.empty?
          answer.value.split(" ").first[0..-2]
        end
      rescue Net::DNS::Resolver::NoResponseError
        nil
      rescue Errno::EAFNOSUPPORT
        options[:use_tcp] = true
        options[:tcp_timeout] = timeout
        retry
      end
    end
  end
end
