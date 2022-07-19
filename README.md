# DEPRECATED

NOTE: This repository and Gem has been deprecated and is no longer supported. This gem was only pulled in by Signon and link-checker-api but not used. Dependency in those apps for this this gem has been removed.

# DeprecatedColumns

Permits a grace period for substractive column changes, via Active Record
migrations.

This was inspired by (read: entirely lifted) from Whitehall with a few
modifications.

## Installation

Add this line to your application's Gemfile:

```gem 'deprecated_columns'```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install deprecated_columns

## Usage

```ruby
class User < ActiveRecord::Base
  deprecated_columns :name
end
```

For subtractive migrations to columns in your schema you'll see a warning,
unless you've specifically marked the column(s) using the `deprecated_columns`
macro.

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/alphagov/deprecated_columns. This project is intended to
be a safe, welcoming space for collaboration, and contributors are expected to
adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT
License](http://opensource.org/licenses/MIT).
