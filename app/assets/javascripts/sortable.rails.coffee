//= require html.sortable 

browserIsCompatible = ->
  document.querySelectorAll and document.addEventListener

return unless browserIsCompatible()

class SortableRails
  @sortable: (list, options) -> 
    list = $(list)
    type = list.prop("tagName") 
    switch type
      when "UL" then @ulSortable(list, options)
      when "TBODY" then @tableSortable(list, options)

  @ulSortable: (list, options)->
    colspan = list.find("li").length
    idField = list.data("sortable-id-field")
    sortBy = list.data("sortable-sort-by")
    model = list.data("sortable-model")

    options = $.extend({
      forcePlaceholderSize: true,
      items: "li",
      placeholder: '<li>&nbsp;</li>'
    }, options)
    dataField = {id_field: idField, sort_by: sortBy, model: model}
    updateSort(list, options, dataField)

  @tableSortable: (list, options)-> 
    colspan = list.children("tr").first().find("td").length
    table = list.parent("table")
    idField = table.data("sortable-id-field")
    sortBy = table.data("sortable-sort-by")
    model = table.data("sortable-model")

    options = $.extend({
      forcePlaceholderSize: true,
      items: "tr",
      placeholder: '<tr><td colspan="#{colspan}">&nbsp;</td></tr>'
    }, options)
    dataField = {id_field: idField, sort_by: sortBy, model: model}
    updateSort(list, options, dataField)

  updateSort = (list, options, dataField)-> 
    list
    .sortable(options) 
    .bind 'sortupdate', ->
      ary = []
      $(this).children().each (index, el) ->
        feature_id = $(this).data("sortable-id")
        ary.push(feature_id)

      $.ajax
        url: 'sortable'
        data: $.extend({ids: ary}, dataField)
        type: "POST"
        success: (d) ->
          console.log(d.status)

window.SortableRails = SortableRails
