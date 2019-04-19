# EtdaUtilities

[![Build Status](https://travis-ci.com/psu-stewardship/etda_utilities.svg?token=aQpbqAxsm8KshbvyB24o&branch=master)](https://travis-ci.com/psu-stewardship/etda_utilities)

Common methods used by etda_workflow and etda_explore

## Installation

This Gem isn't published, so you'll have to install it straight from GitHub, you will also need to have access to this project via ssh, or auth token to install

To install via git, add this line to your applications's Gemfile:

```ruby
gem 'etda_utilities', branch: 'master', git: "git@github.com:psu-stewardship/etda_utilities.git"
```

To install via a personal access token (for non-human, or shared access)
* generate a personal access token and give it the "repo" scope (https://github.com/settings/tokens/new)
* export that token as the `ETDA_UTILITIES_TOKEN` environment variable

Then, add the following line to your application's Gemfile:

```ruby
gem 'etda_utilities', branch: 'master', git: "https://#{ENV['ETDA_UTILITIES_TOKEN']}@github.com/psu-stewardship/etda_utilities.git"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install etda_utilities

## Usage

TODO: Write usage instructions here

## Development

To run in ruby console:
`irb -Ilib -retda_utilities`

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/etda_utilities. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the EtdaUtilities project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/psu-stewardship/etda_utilities/blob/master/CODE_OF_CONDUCT.md).
