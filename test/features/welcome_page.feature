Feature: Newly generated rails application welcomes users
As a Ruby on Rails developer
There should be a default welcome page for a new Rails application
So that I can confirm that my site is working

  Background:
    Given the user navigates to the Home page

  Scenario: The Welcome Page presents welcome message
    Then the user sees the title "PyStudentManager - An App Built By Students, For Students"

  Scenario Outline: Add a student
    When the user sets the student id to <student_id>
    And the user sets the student first name to "<first_name>"
    And the user sets the student last name to "<last_name>"
    And the user clicks the Submit button
    Then the student info is saved
    Examples:
      | student_id | first_name | last_name |
      | 1          | Dennis     | Whalen    |
      | 2          | Lela       | Cochenour |
      | 3          | Kyle       | Cochenour |
      | 4          | Eddie      | Vedder    |