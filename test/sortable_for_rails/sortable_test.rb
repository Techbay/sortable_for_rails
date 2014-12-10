require_relative '../../lib/sortable_for_rails/sortable'
require_relative '../test_helper' 

module SortableForRails
  class TestModel
  end

  class SortableTest < TestCase
    def setup 
      @controller = Class.new do
        include Controller
        sortable "SortableForRails::TestModel"
      end
    end

    def test_include_include_instance_methods
      assert @controller.new.methods.include?(:resort)
    end 

    def test_extend_class_methods
      assert @controller.singleton_methods.include?(:sortable)
    end 
  end
end
