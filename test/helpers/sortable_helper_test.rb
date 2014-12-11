require_relative '../../app/helpers/sortable_helper'
require_relative '../test_helper'
require 'active_support'
require 'action_view'
require 'erb'

class SortableHelperTest < TestCase
  include SortableHelper

  def test_list_sortable
    expected = %Q(<ul class=".sortable"><li>a</li><li>b</li></ul>)
    result = list_sortable(:model) do 
      "<li>a</li><li>b</li>"
    end
    expected += <<JS
<script type="text/javascript">
  SortableRails.ul();
</script>
JS
    assert_equal expected, result
  end

  def test_table_sortable
    expected = %Q(<table class=".sortable"><tr><td></td></tr></table>)
    result = table_sortable(:model) do 
      "<tr><td></td></tr>"
    end
    expected += <<JS
<script type="text/javascript">
  SortableRails.table();
</script>
JS
    assert_equal expected, result
  end
end
