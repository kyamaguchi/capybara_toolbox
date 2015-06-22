if ENV['CI']
  Capybara.register_driver :selenium do |app|
    caps = Selenium::WebDriver::Remote::Capabilities.firefox({
      'tunnel-identifier' => ENV['TRAVIS_JOB_NUMBER']
    })
    url = "http://#{ENV['SAUCE_USERNAME']}:#{ENV['SAUCE_ACCESS_KEY']}@ondemand.saucelabs.com/wd/hub"
    Capybara::Selenium::Driver.new(app, browser: :remote, url: url, desired_capabilities: caps)
  end
elsif ENV['CHROME']
  Capybara.register_driver :selenium do |app|
    # http://chromedriver.storage.googleapis.com/index.html
    # Download latest chromedriver_xxx.zip
    # sudo mv ~/Downloads/chromedriver /usr/bin/
    Capybara::Selenium::Driver.new(app, :browser => :chrome)
  end
end
