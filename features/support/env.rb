require 'cucumber'
require 'selenium'
require 'selenium-webdriver'
$driver = @driver

Before do

  @driver = Selenium::WebDriver.for :chrome
@driver.manage.window.maximize

    end


