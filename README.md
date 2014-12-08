# SortableForRails 

Make lists(like table, ul..) can sort by drag and drop.
Auto update order when finished sorting.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sortable_for_rails'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sortable_for_rails

## Usage

### In rails model

```ruby
class SortableContentModel < ActiveRecord::Base
  sortable :id, with: :index
end
```

### require sortable js

### In the view

## Contributing

1. Fork it ( https://github.com/[my-github-username]/sortable_for_rails/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
