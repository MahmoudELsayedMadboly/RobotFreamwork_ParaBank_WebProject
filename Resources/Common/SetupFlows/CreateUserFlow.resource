
*** Settings ***
Resource    ../BrowserKeyword.resource
Resource    ../../Pages/Register.resource
Resource    ../../Pages/HomePage.resource
Resource    ../../../TestData/Registration_Data.robot


*** Variables ***

${REGISTERED_USERNAME}    ${EMPTY}
${REGISTERED_PASSWORD}    ${EMPTY}






*** Keywords ***
Register Fresh User And Store Credentials
    [Documentation]    Registers a new user and stores the credentials as suite variables to be used as a suite setup for other test cases. This keyword is intended to be used as a suite setup for test suites that require a registered user.
    
    Initialize Browser
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

    Close Application Browser