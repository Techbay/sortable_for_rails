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
      @klass = Class.new do
        include Sortable
      end
    end

    def test_include_sortable_success 
      assert @klass.new.methods.include?(:resort)
    end 

    def test_extend_class_method 
      assert @klass.singleton_methods.include?(:sortable)
    end
  end
end
