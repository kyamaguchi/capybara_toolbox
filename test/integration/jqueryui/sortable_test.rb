require 'test_helper'

class SortableTest < ActionDispatch::IntegrationTest
  test "sort successfully" do
    visit 'https://jqueryui.com/sortable/'
    within('.entry-title') { assert page.has_content?('Sortable') }
  end
end
