require 'erb'
require 'json'

module SortableHelper 
  def ul_sortable(object, options = nil, &block)
    sortable("ul", object, options, &block)
  end

  def table_sortable(object, options = nil, &block)
    sortable("table", object, options, &block)
  end

  private
  def sortable(node, object, options, &block)
    id = "sortable_rails_#{SecureRandom.hex(8)}"
    default_options = {
                  id: id,
                  data: {
                  sortable_id_field: "id", 
                  sortable_sort_by: "index",
                  sortable_sort_url: "sortable",
                  sortable_model: object.to_s.camelize} }

    options = if options.nil?
                default_options
              else
                default_options.deep_merge!(options)
              end
    html = content_tag(node, nil, options, &block) 

    item = if node == "table"
             "##{options[:id]} tbody"
           else
             "##{options[:id]}"
           end 

    js = <<JS
<script type="text/javascript"> 
  $(function(){
    SortableRails.sortable("#{item}");
  })
</script>
JS
    html += raw(js)
    html.respond_to?(:html_safe) ? html.html_safe : html
  end
end
