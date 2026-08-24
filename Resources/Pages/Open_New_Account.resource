*** Settings ***
library     SeleniumLibrary
Resource    ../Common/CommonKeyword.resource



*** Variables ***
#locators
${Open_New_Account_Header}    xpath=//h1[text()='Open New Account']
${Open_New_Account_Button}    xpath=//input[@value='Open New Account']
${Account_Type_Dropdown}    id=type
${FROM_ACCOUNT_DROPDOWN}    id=fromAccountId





*** Keywords ***

Open Checking Account
    [Arguments]    ${fromAccountId}

    Select From List By Value    
    ...    ${Account_Type_Dropdown}    CHECKING

    Select From List By Value    
    ...    ${FROM_ACCOUNT_DROPDOWN}    
    ...    ${fromAccountId}

    Safe Click    
    ...    ${Open_New_Account_Button}



Open Savings Account
    [Arguments]    ${fromAccountId}
    Select From List By Value    
    ...    ${Account_Type_Dropdown}    CHECKING

    Select From List By Value    
    ...    ${FROM_ACCOUNT_DROPDOWN}    
    ...    ${fromAccountId}

    Safe Click    
    ...    ${Open_New_Account_Button}