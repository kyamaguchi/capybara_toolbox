require 'test_helper'

class SortableTest < ActionDispatch::IntegrationTest
  test "demo page for sortable should exisit" do
    visit 'https://jqueryui.com/sortable/'
    within('.entry-title') { assert_text('Sortable') }
  end

  test "sort items successfully" do
    visit 'https://jqueryui.com/resources/demos/sortable/default.html'
    assert_selector('#sortable')
    within('#sortable') { assert_positions('Item 1', 'Item 7') }
    drag_top_to_bottom('.ui-sortable-handle')
    within('#sortable') { assert_positions('Item 7', 'Item 1') }
  end

  test "fail sorting of items without adjustments" do
    visit 'https://jqueryui.com/resources/demos/sortable/default.html'
    assert_selector('#sortable')
    within('#sortable') { assert_positions('Item 1', 'Item 7') }
    drag_top_to_bottom('.ui-sortable-handle', adjust_x: 0, adjust_y: 0)
    within('#sortable') { assert_positions('Item 1', 'Item 7') }
  end
end
