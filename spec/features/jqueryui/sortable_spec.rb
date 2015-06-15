require 'rails_helper'

describe 'Sortable' do
  it "demo page for sortable should exisit" do
    visit 'https://jqueryui.com/sortable/'
    within('.entry-title') { expect(page).to have_content('Sortable') }
  end

  it "sort items successfully" do
    visit 'https://jqueryui.com/resources/demos/sortable/default.html'
    expect(page).to have_selector('#sortable')
    within('#sortable') { assert_positions('Item 1', 'Item 7') }
    drag_top_to_bottom('.ui-sortable-handle')
    within('#sortable') { assert_positions('Item 7', 'Item 1') }
  end

  it "fail sorting of items without adjustments" do
    visit 'https://jqueryui.com/resources/demos/sortable/default.html'
    expect(page).to have_selector('#sortable')
    within('#sortable') { assert_positions('Item 1', 'Item 7') }
    drag_top_to_bottom('.ui-sortable-handle', adjust_x: 0, adjust_y: 0)
    within('#sortable') { assert_positions('Item 1', 'Item 7') }
  end
end
