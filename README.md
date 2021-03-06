### Hexlet tests and linter status:
[![Actions Status](https://github.com/safrio/rails-project-lvl1/workflows/hexlet-check/badge.svg)](https://github.com/safrio/rails-project-lvl1/actions)
[![Ruby](https://github.com/safrio/rails-project-lvl1/actions/workflows/main.yml/badge.svg)](https://github.com/safrio/rails-project-lvl1/actions/workflows/main.yml)

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
# <br />

HexletCode::Tag.build('img', src: 'path/to/image')
# <img src="path/to/image" />

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

Also it can generate forms with data model:
```ruby
User = Struct.new(:name, :job, :gender, keyword_init: true)
user = User.new name: 'rob', job: 'hexlet', gender: 'm'

HexletCode.form_for user do |f|
  f.input :name
  f.input :job, as: :text
  f.submit
end

# <form action="#" method="post">
#   <label for="name">Name</label>
#   <input name="name" type="text" value="rob" />
#   <label for="job">Job</label>
#   <textarea cols="20" name="job" rows="40">hexlet</textarea>
#   <input name="submit" type="submit" value="Save" />
# </form>
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/safrio/rails-project-lvl1.
