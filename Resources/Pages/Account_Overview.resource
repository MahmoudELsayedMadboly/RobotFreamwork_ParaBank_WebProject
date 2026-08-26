*** Settings ***
library     SeleniumLibrary
Resource    ../Common/CommonKeyword.resource



*** Variables ***
#locators
${ACCOUNTS_OVERVIEW_HEADER}    
...    xpath=//h1[normalize-space()='Accounts Overview']
${Account_Column_In_Accounts_Table}    
...    //table[@id='accountTable']/tbody/tr/td[1]/a[text()='${NewAccountId}']    

*** Keywords ***

Verify Accounts Overview Page Is Displayed
    Verify Element Is Visible    
    ...    ${ACCOUNTS_OVERVIEW_HEADER}


Verify New Opened Account Appears In Accounts Table
    [Arguments]    
    ...    ${NewAccountId}
    
    Page Should Contain Element
    ...    xpath=//table[@id='accountTable']/tbody/tr/td[1]/a[text()='${NewAccountId}']

