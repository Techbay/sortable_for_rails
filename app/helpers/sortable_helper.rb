require 'erb'
require 'json'

module SortableHelper 
  def list_sortable(object, options = nil, &block)
    sortable("ul", object, options, &block)
  end

  def table_sortable(object, options = nil, &block)
    sortable("table", object, options, &block)
  end

  private
  def sortable(node, object, options, &block)
    url = 'sortable' 
    options = if options.nil?
                {
                  id: "sortable_rails",
                  data: {
                  sortable_id_field: "id", 
                  sortable_sort_by: "index",
                  sortable_model: object.to_s.camelize}
                }
              else
                options.deep_merge!(id: "sortable_rails")
              end

    html = content_tag(node, nil, options, &block) 
    item = if node == "table"
             "#sortable_rails tbody"
           else
             "#sortable_rails"
           end 

    js = <<JS
<script type="text/javascript">
  SortableRails.sortable("#{item}", "sortable");
</script>
JS
    html += raw(js)
    html.respond_to?(:html_safe) ? html.html_safe : html
  end
end
