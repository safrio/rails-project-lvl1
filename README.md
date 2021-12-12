### Hexlet tests and linter status:
[![Actions Status](https://github.com/safrio/rails-project-lvl1/workflows/hexlet-check/badge.svg)](https://github.com/safrio/rails-project-lvl1/actions)

# HexletCode

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hexlet_code'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install hexlet_code

## Usage

```ruby
HexletCode::Tag.build('br')
# <br>

HexletCode::Tag.build('img', src: 'path/to/image')
# <img src="path/to/image">

HexletCode::Tag.build('input', type: 'submit', value: 'Save')
# <input type="submit" value="Save">

# Для парных тегов тело передается как блок
HexletCode::Tag.build('label') { 'Email' }
# <label>Email</label>

HexletCode::Tag.build('label', for: 'email') { 'Email' }
# <label for="email">Email</label>

HexletCode::Tag.build('div')
# <div></div>
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/safrio/rails-project-lvl1.
