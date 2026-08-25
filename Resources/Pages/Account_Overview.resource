*** Settings ***
library     SeleniumLibrary
Resource    ../Common/CommonKeyword.resource



*** Variables ***
#locators
${ACCOUNTS_OVERVIEW_HEADER}    xpath=//h1[normalize-space()='Accounts Overview']

*** Keywords ***

Verify User Accounts
