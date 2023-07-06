*** Settings ***
Documentation    This file contains the actions of register page
Resource    ../main.robot

*** Variables ***
${MY_ACCOUNT_OPTION}    //a[contains(@title,'My Account')] 
${REGISTER_OPTION}      //a[contains(.,'Register')]

*** Keywords ***

Open the browser
    Open Browser    browser=${BROWSER}    
    Maximize Browser Window

Close the browser
    Capture Page Screenshot
    Close Browser

Click Submit
    Click Element    locator=${SUBMIT_BUTTON}

Check Privacy Policy
    Click Element    locator=//input[@type='checkbox']

Generate valid email
    ${RANDOM}    Generate Random String    length=1-30   
    [Return]   ${RANDOM}@testrobot.com
    
the user is in the register page
    Go To                            url=${URL}
    Wait Until Element Is Visible    locator=${MY_ACCOUNT_OPTION}
    Click Element                    locator=${MY_ACCOUNT_OPTION}
    Click Element                    locator=${REGISTER_OPTION}
    Wait Until Element Is Visible    locator=//h1[contains(.,'Register Account')]

submits the form in blank
    Click Submit

a message error should be displayed below all the fields
    Wait Until Page Contains    text=Warning: You must agree to the Privacy Policy!
    Wait Until Page Contains    text=First Name must be between 1 and 32 characters!
    Wait Until Page Contains    text=Last Name must be between 1 and 32 characters!
    Wait Until Page Contains    text=E-Mail Address does not appear to be valid!
    Wait Until Page Contains    text=Telephone must be between 3 and 32 characters!
    Wait Until Page Contains    text=Password must be between 4 and 20 characters!

the user shouldn't be able to proceed with register
    # if page contains this text, this means the user was not redirected to confirmation
    Page Should Contain    text=Register Account
    
submits the form incomplete
    # just first name and email fields will be populated
    Input Text       locator=${FIRST_NAME_FIELD}    text=${FIRST_NAME}
    ${EMAIL}         Generate valid email
    Input Text       locator=${EMAIL_FIELD}         text=${EMAIL}
    Click Element    locator=${SUBMIT_BUTTON}

    Log    message=The email generated was: ${EMAIL}

a message error should be displayed below the fields in blank
    Wait Until Page Contains    text=Warning: You must agree to the Privacy Policy!
    Wait Until Page Contains    text=Last Name must be between 1 and 32 characters!
    Wait Until Page Contains    text=Telephone must be between 3 and 32 characters!
    Wait Until Page Contains    text=Password must be between 4 and 20 characters!

submits the form with valid data in all fields and an invalid email
    Input Text    locator=${FIRST_NAME_FIELD}          text=${FIRST_NAME}
    Input Text    locator=${LAST_NAME_FIELD}           text=${LAST_NAME}
    Input Text    locator=${EMAIL_FIELD}               text=${INVALID_EMAIL}
    Input Text    locator=${TELEPHONE_FIELD}           text=${TELEPHONE}
    Input Text    locator=${PASSWORD_FIELD}            text=${PASSWORD}
    Input Text    locator=${PASSWORD_CONFIRM_FIELD}    text=${PASSWORD}
    Check Privacy Policy
    Click Submit

submits the form with valid data
    Input Text    locator=${FIRST_NAME_FIELD}          text=${FIRST_NAME}
    Input Text    locator=${LAST_NAME_FIELD}           text=${LAST_NAME}
    ${EMAIL}      Generate valid email
    Input Text    locator=${EMAIL_FIELD}               text=${EMAIL} 
    Input Text    locator=${TELEPHONE_FIELD}           text=${TELEPHONE}
    Input Text    locator=${PASSWORD_FIELD}            text=${PASSWORD}
    Input Text    locator=${PASSWORD_CONFIRM_FIELD}    text=${PASSWORD}
    Check Privacy Policy
    Click Submit

    Log    message=The email generated was: ${EMAIL}
      
the user should be sucessfully registered 
    # if page contains this text, this means the user was redirected to confirmation and the account was created
    Wait Until Page Contains    text=Your Account Has Been Created!
