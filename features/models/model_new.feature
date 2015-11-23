Feature: New object model initialization
  In order to call new method
  As a user
  I want to see new model object with given fields

  Scenario: Check for a new model object with given fields
    Given some fields
    When call new method
    Then I see the new object with a given fields
