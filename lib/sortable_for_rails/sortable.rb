require 'active_support'

module SortableForRails 
  module Model
    extend ActiveSupport::Concern

    module ClassMethods
      def sortable
      end
    end
  end

  module Controller
    def resort
    end 
  end
end
