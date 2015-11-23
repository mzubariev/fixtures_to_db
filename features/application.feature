Feature: Fill the database user table with fixtures from ini formatted file
  In order to task - to fill user table with data
  As a user
  I want to check an appearence of some specific added data in user table

  Scenario: Check for a new rows with specific added data in user table from database
    Given two input parameters
    When I check user table for a new rows with specific added data
    Then I see the rows have been added