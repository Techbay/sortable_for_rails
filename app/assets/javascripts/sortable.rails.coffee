//= require html.sortable 

browserIsCompatible = ->
  document.querySelectorAll and document.addEventListener

return unless browserIsCompatible()

class SortableRails
  @sortable: (item, options) -> 
    item = $(item)
    type = item.prop("tagName") 
    switch type
      when "ul" then ulSortable(item, options)
      when "table" then tableSortable(item, options)

  @ulSortable: (item, options)->
    console.log("ul sort")

  @tableSortable: (item, options)-> 
    console.log("table sort")
    colspan = item.find(tr).length
    url = item.data("url")

    default_options = {
      forcePlaceholderSize: true,
      items: "tr",
      placeholder: '<tr><td colspan="#{colspan}">&nbsp;</td></tr>'
    }

    item
    .sortable(default_options) 
    .bind 'sortupdate', ->
      ary = []
      $(this).find("tr").each (el, index) ->
        feature_id = $(this).data("feature-id")
        console.log(index)
        ary.push(feature_id)

      $.ajax
        url: "/chadmin/channel_widgets/resort"
        data: {ids: ary}
        type: "POST"
        success: (d) ->
          console.log(d.result)
