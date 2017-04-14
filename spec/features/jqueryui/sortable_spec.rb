require 'rails_helper'

describe 'Sortable' do
  it "demo page for sortable should exist" do
    visit 'https://jqueryui.com/sortable/'
    within('.entry-title') { expect(page).to have_content('Sortable') }
  end

  it "sort items successfully" do
    visit 'https://jqueryui.com/resources/demos/sortable/default.html'
    expect(page).to have_selector('#sortable')
    within('#sortable') { expect(page).to have_content_in_order('Item 1', 'Item 7') }
    drag_top_to_bottom('.ui-sortable-handle')
    within('#sortable') { expect(page).to have_content_in_order('Item 7', 'Item 1') }
  end

  it "fail sorting of items without adjustments" do
    pending("Now sorting works without adjustment")
    visit 'https://jqueryui.com/resources/demos/sortable/default.html'
    expect(page).to have_selector('#sortable')
    within('#sortable') { expect(page).to have_content_in_order('Item 1', 'Item 7') }
    drag_top_to_bottom('.ui-sortable-handle', adjust_x: 0, adjust_y: 0)
    within('#sortable') { expect(page).to have_content_in_order('Item 1', 'Item 7') }
  end
end
