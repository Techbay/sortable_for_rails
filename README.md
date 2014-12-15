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

The simplest way to make your list sortable is use helper.

### Migrate

```ruby
rails g migration add_index_to_model index:integer
```

### Helper

```ruby
# :list is your model type.
# you can either use symbol or string 
<%= table_sortable(:list) do %>
  <thead>
    <tr>
      <th>Name</th>
      <th>Index</th>
      <th>Sortable</th>
      <th>Content</th>
      <th colspan="3"></th>
    </tr>
  </thead>

  <tbody>
    <% @lists.each do |list| %>
      <tr data-sortable-id=<%= list.id %>>
        <td><%= list.name %></td>
        <td><%= list.index %></td>
        <td><%= list.sortable_id %></td>
        <td><%= list.content %></td>
        <td><%= link_to 'Show', list %></td>
        <td><%= link_to 'Edit', edit_list_path(list) %></td>
        <td><%= link_to 'Destroy', list, method: :delete, data: { confirm: 'Are you sure?' } %></td>
      </tr>
    <% end %>
  </tbody>
<% end %>

<%= list_sortable(:list) do %> 
<% end %>
``` 

### Routes

You should amount the route below in your routes.rb file

```ruby
post "sortable" => "sortable_rails#sortable"
```

### Options:

We expected your model has an :id and :index attribute as our default options, which map to `sortable_id_field` and `sortable_sort_by` as below:

```ruby
{
  id: "sortable_rails", # the identity attribute of which list you want to sort
  data: {
    sortable_id_field: "id",  # the identity field that to find your record
    sortable_sort_by: "index" # the index to order by with
  }
}
```

If you don't provide an id option, we will generate a random id for your list

Also you can change that with your own set 

### Javascript API

You can also use Javascript API to make your list sortable manully.

We use htmlSortablejs as our default sortable javascript library, so you can choose to use javascript api instead of helper inorder to have more choise to config your list.

```javascript
  SortableRails.sortable(".sortable tbody", options);
```

If you choose to use javascript api, you should manually add some options to your node, eg:

```html
<table class="sortable" data-sortable-model="list" data-sortable-id-field="id" data-sortable-sort-by="index"> 
```

And, you can use [html5Sortable](https://github.com/voidberg/html5sortable)'s options to config sortable behavior.

Find more example in example :) 

## TODO

* add test
* support for other js

## Contributing

1. Fork it ( https://github.com/[my-github-username]/sortable_for_rails/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
