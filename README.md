# Smart Energy Group

[![Circle CI](https://circleci.com/gh/johnf/smart_energy_group.svg?style=svg)](https://circleci.com/gh/johnf/smart_energy_group)
[![Coverage Status](https://coveralls.io/repos/johnf/smart_energy_group/badge.svg?branch=master&service=github)](https://coveralls.io/github/johnf/smart_energy_group?branch=master)

Ruby library for talking to the Smart Energy Group API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'smart_energy_group'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install smart_energy_group

## Usage

In order to use smart_energy_group in your application you need to use

```ruby
require 'smart_energy_group/client'
```

First step is to create a Smart Energy Group client using your Smart Energy Group assigned site_token

```ruby
seg = SmartEnergyGroup::Client.new(site_token)
```
TODO: Add exampleshere

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/johnf/pvoutput. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
