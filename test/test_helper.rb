require 'minitest/autorun'
require 'minitest/pride'

begin
  # 2.0.0
  class TestCase < MiniTest::Test; end
rescue NameError
  # 1.9.3
  class TestCase < MiniTest::Unit::TestCase; end
end
