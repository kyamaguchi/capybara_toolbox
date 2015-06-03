require 'test_helper'

class SortableTest < ActionDispatch::IntegrationTest
  test "demo page for sortable should exisit" do
    visit 'https://jqueryui.com/sortable/'
    within('.entry-title') { assert_text('Sortable') }
  end

  test "sort items successfully" do
    visit 'https://jqueryui.com/resources/demos/sortable/default.html'
    assert_selector('#sortable')
    within('#sortable') { assert page.text.index('Item 1') < page.text.index('Item 7'), 'Each item should have initial order.' }
    drag_top_to_bottom('.ui-sortable-handle')
    within('#sortable') { assert page.text.index('Item 7') < page.text.index('Item 1'), 'Item 1 should be moved below Item 7.' }
  end
end
