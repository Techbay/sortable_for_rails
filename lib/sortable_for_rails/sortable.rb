require 'active_support'

module SortableForRails 
  module Sortable
    extend ActiveSupport::Concern
    def resort
    end 

    module ClassMethods
      def sortable
      end
    end
  end
end
