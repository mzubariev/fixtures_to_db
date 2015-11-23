Feature: Call the save model method
  In order to task - to fill database with specific data
  As a user
  I want to check an appearence of some specific added data in database

  Scenario: Check for a new row with specific added data
    Given a new object with set fields
    When call save method
    Then I see the row have been added