*** Settings ***
Documentation    This file contains the test cases for register
Resource         ../resources/main.robot
Test Setup       Open the browser
Test Teardown    Close the browser


*** Test Cases ***

Test Scenario 01: Submit form with no data
    [Documentation]   This test validates if the user will not be registered when the form is submited in blank
    Given the user is in the register page
    When submits the form in blank
    Then a message error should be displayed below all the fields
    And the user shouldn't be able to proceed with register

Test Scenario 02: Submit form incomplete
    [Documentation]  This test validates if the user will not be registered when the form is submited incomplete
    Given the user is in the register page
    When submits the form incomplete
    Then a message error should be displayed below the fields in blank
    And the user shouldn't be able to proceed with register

Test Scenario 03: Submit form with invalid email
    [Documentation]  This test validates if the user will not be registered when the form is submited with an invalid email
    Given the user is in the register page
    When submits the form with valid data in all fields and an invalid email
    Then the user shouldn't be able to proceed with register

Test Scenario 04: Submit form sucessfully
    [Documentation]  This test validates if the user will be registered when the form is submited with valid data
    Given the user is in the register page
    When submits the form with valid data
    Then the user should be sucessfully registered 

