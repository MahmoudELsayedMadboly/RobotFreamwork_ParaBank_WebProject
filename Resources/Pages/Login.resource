*** Settings ***
library     SeleniumLibrary
Resource    ../Common/CommonKeyword.resource



*** Variables ***
#locators
${Login_Username}    name=username    
${Login_Password}    name=password    
${Login_Button}    xpath=//input[@value='Log In']
${ACCOUNTS_OVERVIEW_HEADER}    css=#showOverview h1.title
${LOGIN_ERROR_HEADER}     css=#rightPanel h1.title
${LOGIN_ERROR_MESSAGE_InvalidCredentials}    xpath=//p[text()='An internal error has occurred and has been logged.']            
${LOGIN_ERROR_MESSAGE_NullCredentials}    xpath=//p[text()='Please enter a username and password.']


*** Keywords ***

Login With User Credentials
    [Arguments]    ${username}    ${password}
    Safe Input Text    ${Login_Username}    ${username}
    Safe Input Text    ${Login_Password}    ${password}
    Safe Click    ${Login_Button}




Verify Login Success
    [Arguments]    ${expectedSuccessHeaderText}
    Verify Element Is Visible    ${ACCOUNTS_OVERVIEW_HEADER}
    Compare Element Text    ${ACCOUNTS_OVERVIEW_HEADER}    ${expectedSuccessHeaderText}



Verify Login Failure
    [Arguments]     ${LOGIN_ERROR_MESSAGE}    ${expectedFailureHeaderText}    
    Verify Element Is Visible    ${LOGIN_ERROR_HEADER}
    Compare Element Text    ${LOGIN_ERROR_MESSAGE}    ${expectedFailureHeaderText}