# Reversed

:earth_americas: Reverse DNS / IP Lookup for Ruby

```ruby
Reversed.lookup("8.8.4.4")
# "dns.google"
```

Works with IPv4 and IPv6

```ruby
Reversed.lookup("2a03:2880:2110:df07:face:b00c::1")
# "a.ns.facebook.com"
```

## Installation

Add this line to your application’s Gemfile:

```ruby
gem 'reversed'
```

And then execute:

```sh
bundle
```

## Reference

Set timeout

```ruby
Reversed.lookup(ip, timeout: 3)
```

Set nameservers

```ruby
Reversed.lookup(ip, nameservers: ["8.8.8.8"])
```

## History

View the [changelog](https://github.com/ankane/reversed/blob/master/CHANGELOG.md)

## Contributing

Everyone is encouraged to help improve this project. Here are a few ways you can help:

- [Report bugs](https://github.com/ankane/reversed/issues)
- Fix bugs and [submit pull requests](https://github.com/ankane/reversed/pulls)
- Write, clarify, or fix documentation
- Suggest or add new features

