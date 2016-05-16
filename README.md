# Smart Energy Group

[![Circle CI](https://circleci.com/gh/johnf/smart_energy_group.svg?style=svg)](https://circleci.com/gh/johnf/smart_energy_group)
[![Coverage Status](https://coveralls.io/repos/github/johnf/smart_energy_group/badge.svg?branch=master)](https://coveralls.io/github/johnf/smart_energy_group?branch=master)

Ruby library for talking to the Smart Energy Group API.

Documentation for the API can be found at https://smartenergygroups.com/api

## Installation

Add this line to your application's Gemfile:

``` ruby
gem 'smart_energy_group'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install smart_energy_group

## Usage

In order to use smart_energy_group in your application you need to use

``` ruby
require 'smart_energy_group/client'
```

First step is to create a Smart Energy Group client using your Smart Energy Group assigned site_token

``` ruby
seg = SmartEnergyGroup::Client.new(site_token)
```

You can then push data points

``` ruby
seg.send_data(
  'home',
  :temperature => [20.5, 60.0],
  :power       => [1023.6, 500.9]
)
```

If you don't have consecutive channels that you want to send you can pass an
array like so

``` ruby
seg.send_data(
  'home',
  :power       => { 1 => 1023.6, 5 => 500.9 }
)
```

The send_data operation accepts the following options

| Option      | Description |
| ----------- | ----------- |
| power       | Power stream with the unit of watts |
| energy      | Energy stream with the unit prefixed to kilowatt hours |
| amps        | Current stream with the unit of amps |
| channel     | Power stream identified with the Phase based on the channel number, with the same settings as a normal power stream |
| temperature | Temperature stream with default units of Celcius |
| voltage     | Voltage stream with the units being volts |
| state       | Switch state stream to determine if a switch is on or off |
| seconds     | Seconds stream representitive of an elapsed time in seconds |
| heartbeat   | Boot Event stream to determine if your device has booted and also records a heartbeat to check things are still ticking |
| pule        | Count of pulses output from a device |

**Note::** The above will raise an error until you put the site into Discovery mode on the SEG website.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/johnf/pvoutput. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
