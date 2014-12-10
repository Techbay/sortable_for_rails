require_relative '../../lib/sortable_for_rails/sortable'
require 'minitest/autorun'
require 'minitest/pride'

begin
  # 2.0.0
  class TestCase < MiniTest::Test; end
rescue NameError
  # 1.9.3
  class TestCase < MiniTest::Unit::TestCase; end
end

module SortableForRails
  class SortableTest < TestCase
    def setup 
      @model = Class.new do
        include Model
      end
      @controller = Class.new do
        include Controller
      end
    end

    def test_include_include_instance_methods
      assert @controller.new.methods.include?(:resort)
    end 

    def test_extend_class_methods
      assert @model.singleton_methods.include?(:sortable)
    end 
  end
end
