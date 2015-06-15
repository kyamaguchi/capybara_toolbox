require 'rails_helper'

describe 'Resizable' do
  let(:handle_css) { '.ui-resizable-se.ui-icon' }

  it "demo page for resizable should exist" do
    visit 'https://jqueryui.com/resizable/'
    within('.entry-title') { expect(page).to have_content('Resizable') }
  end

  it "resize an item successfully" do
    visit 'https://jqueryui.com/resources/demos/resizable/default.html'
    expect(page).to have_selector('#resizable')
    before_x, before_y = positions_of_resizable_handle(handle_css)
    resize_by(handle_css, 10, 10)
    after_x, after_y = positions_of_resizable_handle(handle_css)

    # Size after resizing is bigger
    expect(before_x).to be < after_x
    expect(before_y).to be < after_y
  end
end
