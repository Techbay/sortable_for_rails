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

### Options:

We expected your model has an :id and :index attribute as our default options.
eg:

```ruby
{
  id: "sortable_rails",
  data: {
    sortable_id_field: "id",  # the identity field that to find your record
    sortable_sort_by: "index" # the index to order by with
  }
}
```

But you can change that with your own set

### Javascript API

You can also use Javascript API to make your list sortable manully.

We use htmlSortablejs as our default sortable javascript library, so you can choose to use javascript api instead of helper inorder to have more choise to config your list.

```javascript
  SortableRails.sortable(".sortable tbody", "");
```

Find more example in example :) 

## TODO

* support for other js

## Contributing

1. Fork it ( https://github.com/[my-github-username]/sortable_for_rails/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
