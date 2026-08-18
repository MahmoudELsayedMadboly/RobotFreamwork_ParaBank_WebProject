*** Settings ***
Resource    ../Resources/Common/BrowserKeyword.resource
Resource    ../Resources/Pages/Register.resource
Resource    ../TestData/Registration_Data.robot

Test Setup       Initialize Browser
Test Teardown    Close Application Browser


*** Test Cases ***


Set Register User Data
    [Documentation]    This test case sets the user data for registration using the provided test data.
    Set Register User Data    
    ...    ${firstName}    
    ...    ${lastName}    
    ...    ${address}    
    ...    ${city}    
    ...    ${state}    
    ...    ${zipCode}    
    ...    ${phone}    
    ...    ${ssn}    
    ...    ${username}    
    ...    ${password}


Submit Registration Request
    [Documentation]    This test case submits the registration request and verifies the success message.


verify Registration Success
    [Documentation]    This test case verifies that the registration was successful by checking for a success message.
    Verify Registration Success    ${ExpectedSuccessMessageText}