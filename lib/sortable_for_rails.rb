require "sortable_for_rails/version"
require "sortable_for_rails/sortable"

begin
  require "pry"
rescue LoadError
end

module SortableForRails
  class Engine < ::Rails::Engine
  end
end
