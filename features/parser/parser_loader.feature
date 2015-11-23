Feature: Call the loader Parser factory method
  In order to call loader Parser method
  As a user
  I want to see new Parser object with two fields

  Scenario: Check for a new Parser object
    Given a new object with set fields
    When call loader method
    Then I see the new Parser object with two fields