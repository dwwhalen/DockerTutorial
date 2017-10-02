require 'watir'

Given(/^I am on the Welcome Page$/) do
  @browser.goto "http://localhost:3000"
end

Then(/^I should see the title "(.*?)"$/) do |message|
fail unless @browser.title == message
end