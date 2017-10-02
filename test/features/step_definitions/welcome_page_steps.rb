require 'watir'

Given(/^the user navigates to the Home page$/) do
  visit HomePage
end

Then(/^the user sees the title "(.*?)"$/) do |message|
  expect(on(HomePage).title).to eq message
end

And(/^the user sets the student id to (\d+)$/) do |student_id|
  on(HomePage).student_id = student_id
end

And(/^the user sets the student first name to "(.*?)"$/) do |first_name|
  on(HomePage).student_first_name = first_name
end

And(/^the user sets the student last name to "(.*?)"$/) do |last_name|
  on(HomePage).student_last_name = last_name
end

And(/^the user clicks the Submit button$/) do
  @row_count_before_submit = on(HomePage).table_row_count
  on(HomePage).submit_button
end

Then(/^the student info is saved$/) do
  expect(on(HomePage).table_row_count).to eq @row_count_before_submit + 1
end