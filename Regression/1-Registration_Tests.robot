*** Settings ***
Resource    ../Resources/Common/BrowserKeyword.resource
Resource    ../Resources/Pages/Register.resource
Resource    ../TestData/Registration_Data.robot
resource    ../Resources/Pages/HomePage.resource

Test Setup       Initialize Browser
Test Teardown    Close Application Browser


*** Test Cases ***

TC_001_Verify User Registration
    [Documentation]    This test case verifies the user registration functionality by navigating to the Register page, filling in the registration form with valid data, submitting the form, and verifying the success message.
    [tags]    Regression

    Verify HomePage Loaded
    Navigate To Register Page
    ${username}    ${password}=    Set Register User Data  
    ...    ${FIRST_NAME}    
    ...    ${LAST_NAME}    
    ...    ${ADDRESS}    
    ...    ${CITY}    
    ...    ${STATE}    
    ...    ${ZIPCODE}    
    ...    ${PHONE}    
    ...    ${SSN}      

    Submit Registration Request
    Verify Registration Success    
    ...    ${ExpectedSuccessMessageText}

    Set Suite Variable    
    ...    ${REGISTERED_USERNAME}    
    ...    ${username}

    Set Suite Variable    
    ...    ${REGISTERED_PASSWORD}    
    ...    ${password}



TC_002_Verify Duplicate User Registration Is Rejected
    [Documentation]    This test case verifies that the application correctly handles duplicate user registration attempts by trying to register with an existing username and checking for the appropriate error message.
    [tags]    Regression

    Verify HomePage Loaded
    Navigate To Register Page
    Set Register User Data With Existing User Credentials
    ...    ${FIRST_NAME}
    ...    ${LAST_NAME}
    ...    ${ADDRESS}
    ...    ${CITY}
    ...    ${STATE}    
    ...    ${ZIPCODE}    
    ...    ${PHONE}    
    ...    ${SSN}    
    ...    ${REGISTERED_USERNAME}
    ...    ${REGISTERED_PASSWORD}

    Submit Registration Request
    Verify Dublicate User Is Rejected    
    ...    ${ExpectedErrorMessageText}