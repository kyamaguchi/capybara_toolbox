require 'rails_helper'

describe 'Confirmation' do
  it "click ok on confirmation dialog" do
    visit '/examples/confirmation'
    within('h3') { expect(page).to have_content('Confirmation') }
    click_on 'Confirm Dialog'
    expect(page).to have_confirmation('Are you sure')
    within('h3') { expect(page).to have_content('Confirmed') }
  end

  it "click ok without verifying message on confirmation dialog" do
    visit '/examples/confirmation'
    within('h3') { expect(page).to have_content('Confirmation') }
    click_on 'Confirm Dialog'
    expect(page).to have_confirmation
    within('h3') { expect(page).to have_content('Confirmed') }
  end

  it "click ok explicit with `and_click_ok` on confirmation dialog" do
    visit '/examples/confirmation'
    within('h3') { expect(page).to have_content('Confirmation') }
    click_on 'Confirm Dialog'
    expect(page).to have_confirmation('Are you sure').and_click_ok
    within('h3') { expect(page).to have_content('Confirmed') }
  end

  it "click cancel on confirmation dialog" do
    visit '/examples/confirmation'
    within('h3') { expect(page).to have_content('Confirmation') }
    click_on 'Confirm Dialog'
    expect(page).to have_confirmation('Are you sure').and_click_cancel
    within('h3') { expect(page).to have_content('Confirmation') }
  end
end
