//= require html.sortable 

browserIsCompatible = ->
  document.querySelectorAll and document.addEventListener

return unless browserIsCompatible()

class SortableRails
  @sortable: (item, url, options) -> 
    console.log(item)
    item = $(item)
    type = item.prop("tagName") 
    console.log(type)
    switch type
      when "UL" then @ulSortable(item, url, options)
      when "TBODY" then @tableSortable(item, url, options)

  @ulSortable: (item, url, options)->
    console.log("ul sort")

  @tableSortable: (item, url, options)-> 
    colspan = item.find("tr").length
    table = item.parent("table")
    idField = table.data("sortable-id-field")
    sortBy = table.data("sortable-sort-by")
    model = table.data("sortable-model")
    console.log(model)
    url = item.data("url") or "sortable"

    options = $.extend({
      forcePlaceholderSize: true,
      items: "tr",
      placeholder: '<tr><td colspan="#{colspan}">&nbsp;</td></tr>'
    }, options)
    console.log(options)

    item
    .sortable(options) 
    .bind 'sortupdate', ->
      ary = []
      $(this).find("tr").each (index, el) ->
        feature_id = $(this).data("sortable-id")
        ary.push(feature_id)
      console.log(ary)

      $.ajax
        url: url
        data: {ids: ary, id_field: idField, sort_by: sortBy, model: model}
        type: "POST"
        success: (d) ->
          console.log(d.result)

window.SortableRails = SortableRails
