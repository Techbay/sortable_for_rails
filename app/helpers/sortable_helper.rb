require 'erb'
require 'json'
require 'pry'

module SortableHelper 
  def list_sortable &block
    sortable(:ul, &block)
  end

  def table_sortable &block
    sortable(:table, &block)
  end

  private
  def sortable(node, &block)
    html = "<#{node.to_s} class=\".sortable\">"
    html <<  yield(block)
    html << "</#{node.to_s}>" 
    html
  end
end
