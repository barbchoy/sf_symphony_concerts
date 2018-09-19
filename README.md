# SfSymphonyConcerts

Welcome to the SfSymphonyConcerts CLI (Command Line Interface). This CLI will find out the upcoming concerts of the San Francisco Symphony. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sf_symphony_concerts'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sf_symphony_concerts

## Usage

After installation, type `ruby bin/sf-symphony-concerts`.

The CLI will display a list of months.

Select a month from the list, then it will display the list of concerts for the selected month.

Select a concert from the list of concerts for further details, or type exit or back to go back to the list of concerts.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'barbchoy'/sf_symphony_concerts.
