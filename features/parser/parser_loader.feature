Feature: Loader of Parser factory method to call one of the two Parser classes
  In order to call loader Parser method
  As a user
  I want to see new Parser object with two fields

  Scenario: Check for a new Parser object
    Given Parser class name and two params for new instance
    When call loader method
    Then I see the new Parser object with two fields