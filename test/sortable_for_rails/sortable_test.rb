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
      end
    end

    def test_include_sortable_success 
      @klass.instance_eval do 
        include Sortable
      end
      assert @klass.method_defined?(:resort)
    end 
  end
end
