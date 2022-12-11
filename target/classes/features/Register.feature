@regression
Feature: test register
  Background:
    Given initialize register feature
  Scenario: Register with valid data
    When user press register icon
    And user selects "male" and enters "ahmed" as first name, "basiouny" as last name, "ahmed@basiuny.com" as email, "ssv" as company, "ahmed123" as password and "ahmed123" as confirm password
    And user set his birthday as follow "10" Day "4" Month "1990" Year
    And user clicks on register button
    Then successful registration message appears

  Scenario: user didn't enter any data
    When user press register icon
    And user clicks on register button
    Then error messages appear

  Scenario: user didn't enter the same password
    When user press register icon
    And user selects "male" and enters "ahmed" as first name, "basiouny" as last name, "ahmed@hassan.com" as email, "ssv" as company, "ahmed123" as password and "ahmed12" as confirm password
    And user set his birthday as follow "10" Day "4" Month "1990" Year
    And user clicks on register button
    Then user get non identical passwords

  Scenario: email already exist
    When user press register icon
    And user selects "male" and enters "ahmed" as first name, "basiouny" as last name, "ahmed@basiuny.com" as email, "ssv" as company, "ahmed123" as password and "ahmed123" as confirm password
    And user set his birthday as follow "10" Day "4" Month "1990" Year
    And user clicks on register button
    Then email exist message appears
