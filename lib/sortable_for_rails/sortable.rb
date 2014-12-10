require 'active_support'

module SortableForRails 
  module Controller
    extend ActiveSupport::Concern

    module ClassMethods
      def sortable(model_name, id_field = :id, sort_by = :index)
        klass = Object.const_get(model_name.to_s)

        define_method :resort do
          ids_ary = params[:ids]
          ids_ary.each_with_index do |id, index| 
            klass.find_by(id_field => id).update(sort_by => index)
          end
          # render :json => {result: "success"} 
        end
      end
    end
  end
end
