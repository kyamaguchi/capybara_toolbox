require 'rspec/expectations'
# This works with selenium driver.
# Confirmation is ignored with rack_test.
RSpec::Matchers.define :have_confirmation do |message|
  chain :and_click_ok do
    @choice = 'ok'
  end

  chain :and_click_cancel do
    @choice = 'cancel'
  end

  match do |page|
    if Capybara.current_driver == :selenium
      if message.present?
        @has_confirmation = page.driver.browser.switch_to.alert.text.include?(message)
      else
        # Skip check of message on dialog
        @has_confirmation = true
      end
      if @choice.nil? || @choice == 'ok'
        page.driver.browser.switch_to.alert.accept
      else
        page.driver.browser.switch_to.alert.dismiss
      end
      sleep 1
      @has_confirmation
    else
      true
    end
  end
end
