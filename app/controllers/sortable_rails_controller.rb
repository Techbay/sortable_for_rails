class SortableRailsController < ApplicationController
  
  def sortable
    ids_ary = params[:ids]
    id_field = params[:id_field] || :id
    sort_by = params[:sort_by] || :index
    klass = params[:model].camelize.constantize

    ids_ary.each_with_index do |id, index| 
      klass.find_by(id_field => id).update(sort_by => index)
    end
    render :json => {result: "success"} 
  end

end
