require 'selenium-webdriver'
require 'cucumber'
require 'rspec'

Given(/^navigate to demotoolQa website$/) do
  # $browser = @browser
   @driver.navigate.to"https://demoqa.com/webtables"
  sleep 20
  # page.load.timeout(second, 10)
  # page.scroll

end

Then(/^click on add button$/) do
  # wait = Selenium::WebDriver::Wait.new(timeout: 10)
  # @driver.wait
  #  @driver.find_element(:id, "addNewRecordButton").click
  add_button = @driver.find_element(css: '.btn.btn-primary')
  add_button.click

end

# Then(/^"enter the first name(.*),last name(.*),email(.*), age(.*),salary(.*),and department(.*) "$/) do |first_name, last_name, email, age, salary, department|
# Then('enter the first name {string}, last name {string}, email {string}, age {string}, salary {string}, and department {string}')do |first_name{string}, last_name{string2}, email{string3}, age{string4}, salary{string5}, department{string6}|
Then('enter the first name {string}, last name {string}, email {string}, age {string}, salary {string}, and department {string}')do |first_name, last_name, email, age, salary, department|

  @driver.find_element(id: 'firstName').send_keys(first_name)
  @driver.find_element(id: 'lastName').send_keys(last_name)
  @driver.find_element(id: 'userEmail').send_keys(email)
  @driver.find_element(id: 'age').send_keys(age)
  @driver.find_element(id: 'salary').send_keys(salary)
  @driver.find_element(id: 'department').send_keys(department)
  submit_button = @driver.find_element(id: 'submit')
  submit_button.click
  sleep 5

end


Then(/^click on search and enter the registered first name "(.*)$/) do|first_name|
  @driver.find_element(:id,"searchBox").send_keys(:enter,first_name)
  # @driver.find_element(:xpath, "//*[@id='submit']").click
  #  text = @driver.get_text(@driver.find_element(:xpath, "//*[@id='app']/div/div/div/div[2]/div[2]/div[3]/div[1]/div[2]/div[1]/div/div[1]").text)

  first_row = @driver.find_element(css: 'div.rt-tr-group:nth-child(1)')
  # Get the first cell (first name) in that row
  first_name = first_row.find_element(css: 'div:nth-child(1)').text
  puts "First Name: #{first_name}"

  # To be corrected
  # expected_first_name = 'Anmol'  # Change this to the expected first name
  # expect(first_name).to eq(expected_first_name)  # RSpec assertion
end

Then(/^delete the search result(.*)$/) do|first_name|
  RSpec.describe "Web Table Row Deletion" do
    it "deletes a specific row in the table" do

  name_to_delete = first_name

  # Locate the row with the specified name
  row_to_delete = @driver.find_element(xpath: "//div[contains(@class, 'rt-tr-group')][.//div[text()='#{name_to_delete}']]")

  # Click the delete button for that row
  delete_button = row_to_delete.find_element(xpath: './/span[contains(@class, "delete")]')
  delete_button.click

  # Optionally, confirm the deletion in the alert (if any)
  @driver.switch_to.alert.accept rescue nil  # Handle alert if it appears

  # Wait to allow the table to update
  sleep 2  # Replace with a more robust wait if necessary

  # Check if the row still exists
  begin
    @driver.find_element(xpath: "//div[contains(@class, 'rt-tr-group')][.//div[text()='#{name_to_delete}']]")
    puts "#{name_to_delete} was not deleted."
  rescue Selenium::WebDriver::Error::NoSuchElementError
    puts "#{name_to_delete} has been successfully deleted."

  end
    end
    end
end

