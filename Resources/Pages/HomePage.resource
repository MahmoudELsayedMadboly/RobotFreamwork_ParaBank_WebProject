*** Settings ***
library     SeleniumLibrary
Resource    ../Common/CommonKeyword.resource
Resource    register.resource
Resource    Open_New_Account.resource
Resource    Account_Overview.resource

*** Variables ***
#locators
${REGISTER_LINK}    xpath=//a[text()='Register']
${OPEN_NEW_ACCOUNT_LINK}    xpath=//a[text()='Open New Account']
${ACCOUNTS_OVERVIEW_LINK}    xpath=//a[text()='Accounts Overview']
${UPDATE_CONTACT_INFO_LINK}    xpath=//a[text()='Update Contact Info']
${UPDATE_PROFILE_PAGE_HEADER}    xpath=//h1[@class='title' and normalize-space(text())='Update Profile']
${REQUEST_LOAN_LINK}             xpath=//a[normalize-space(text())='Request Loan']
${REQUEST_LOAN_PAGE_HEADER}      xpath=//h1[@class='title' and normalize-space(text())='Apply for a Loan']
${ACCOUNTS_OVERVIEW_HEADER}      xpath=//h1[@class='title' and normalize-space(text())='Accounts Overview']




*** Keywords ***

Verify HomePage Loaded
    [Documentation]    Verifies that the Home page is loaded by checking for the presence of the Register link
    Location Should Be    ${URL}  


Navigate To Register Page
    [Documentation]    Navigates to the Register page by clicking on the Register link
    navigate To Page    ${REGISTER_LINK}    ${REGISTER_PAGE_HEADER}


Navigate To Accounts Overview Page
    [Documentation]    Navigates to the Accounts Overview page by clicking on the Accounts Overview link
    navigate To Page    ${ACCOUNTS_OVERVIEW_LINK}    ${ACCOUNTS_OVERVIEW_HEADER}


Navigate To Open New Account Page
    [Documentation]    Navigates to the Open New Account page by clicking on the Register link
    navigate To Page    ${OPEN_NEW_ACCOUNT_LINK}    ${Open_New_Account_Header}


Navigate To Update Contact Info Page
    [Documentation]    Navigates to the Update Contact Info page by clicking on the Update Contact Info link
    navigate To Page    ${UPDATE_CONTACT_INFO_LINK}    ${UPDATE_PROFILE_PAGE_HEADER}



Navigate To Request Loan Page
    Navigate To Page    ${REQUEST_LOAN_LINK}    ${REQUEST_LOAN_PAGE_HEADER}