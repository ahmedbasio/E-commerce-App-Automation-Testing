@regression
Feature: Test Login Functionality
  Background:
    Given initialize login feature
  Scenario: Enter Valid Data
    When enter email "ahmed@basiuny.com" and password "ahmed123"
    And press login
    Then user go to home page

  Scenario: Enter invalid Data
    When enter email "help@gmail.com" and password "ssv"
    And press login
    Then check on error message

  Scenario: Enter invalid email form
    When enter email "help" and password "qwwe"
    Then check on email error message

  Scenario: user forget Password
    When user press forget password
    And user enter email "ahmed@basiuny.com"
    And press recover button
    Then user gets instructions message has been sent