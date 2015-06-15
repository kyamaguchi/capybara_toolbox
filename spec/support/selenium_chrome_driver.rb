if ENV['CHROME']
  Capybara.register_driver :selenium do |app|
    # http://chromedriver.storage.googleapis.com/index.html
    # Download latest chromedriver_xxx.zip
    # sudo mv ~/Downloads/chromedriver /usr/bin/
    Capybara::Selenium::Driver.new(app, :browser => :chrome)
  end
end
