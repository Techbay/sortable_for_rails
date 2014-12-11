require 'erb'
require 'json'
require 'pry'

module SortableHelper 
  def list_sortable(object, &block)
    sortable(:ul, object, &block)
  end

  def table_sortable(object, &block)
    sortable(:table, object, &block)
  end

  private
  def sortable(node, object, &block)
    html = "<#{node.to_s} class=\".sortable\">"
    html <<  yield(block)
    html << "</#{node.to_s}>" 

    js = <<JS
<script type="text/javascript">
  SortableRails.#{node.to_s}();
</script>
JS
    html += js
    html.respond_to?(:html_safe) ? html.html_safe : html
  end
end
