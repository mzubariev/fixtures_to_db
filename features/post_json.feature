Feature: Fill the database post table with fixtures from json formatted file
  In order to task - to fill post table with data
  As a user
  I want to check an appearence of some specific added data in post table

  Scenario: Check for a new rows with specific added data (from json file) in post table from database
    Given two input parameters: 'post' and 'json'
    When I check post table for a new rows with specific added data (json)
    Then I see the rows have been added (post, json)

